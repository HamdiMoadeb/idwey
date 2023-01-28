import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idwey/utils/colors.dart';
import 'package:idwey/widgets/common/scaffold.dart';

import '../models/event.dart';
import '../services/eventCalls.dart';
import '../widgets/common/footer.dart';
import '../widgets/listItems/eventListItem.dart';
import '../widgets/tabs/EventFilterTab.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  dynamic searchInputs = {
    'start': '',
    'end': '',
    'address': '',
    'location_id': ''
  };
  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 2), curve: Curves.linear);
  }

  void updateSearchFields(dynamic searchInputs) {
    setState(() {
      this.searchInputs = searchInputs;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: primaryGrey));
    return CommonScaffold(
      scaffoldKey: _scaffoldKey,
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Stack(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 230,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset("assets/eventcover.jpg",
                                fit: BoxFit.cover),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Calendrier \n d\'événements',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 180),
                      child: EventFilterTab(
                        onChangeField: (dynamic searchInputs) =>
                            updateSearchFields(searchInputs),
                      ),
                    ),
                  ],
                ),
              ),
              EventList(
                searchInputs: searchInputs,
              ),
              //footer
              Footer(),
              CreatedBy(),
              BackToTop(scrollToTop),
            ]),
      ),
    );
  }
}

class EventList extends StatefulWidget {
  dynamic searchInputs;

  EventList({Key? key, required this.searchInputs}) : super(key: key);

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: EventCalls.getEventsList(widget.searchInputs),
      builder: (context, AsyncSnapshot<List<Event>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          final List<Event> listEvents = snapshot.data!.toList();

          if (listEvents != null) {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "${listEvents.length} Événements trouvés",
                    style: TextStyle(
                      fontSize: 24.0,
                      color: titleBlue,
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) => Container(
                      margin: EdgeInsets.only(bottom: 15, right: 15),
                      child: EventListItem(listEvents[index])),
                  itemCount: listEvents.length,
                ),
              ],
            );
          }
        }

        return Container(
          margin: EdgeInsets.only(top: 30),
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(primary),
            ),
          ),
        );
      },
    );
  }
}
