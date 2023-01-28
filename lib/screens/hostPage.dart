import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idwey/utils/colors.dart';
import 'package:idwey/widgets/common/scaffold.dart';

import '../models/host.dart';
import '../services/hostCalls.dart';
import '../widgets/common/footer.dart';
import '../widgets/listItems/hostListItem.dart';
import '../widgets/tabs/HostFilterTab.dart';

class HostPage extends StatefulWidget {
  const HostPage({Key? key}) : super(key: key);

  @override
  State<HostPage> createState() => _HostPageState();
}

class _HostPageState extends State<HostPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();

  dynamic searchInputs = {'start': '', 'end': '', 'address': '', 'adults': ''};
  List<Host> hosts = [];

  getAllHosts() {
    HostCalls.getHostsList(searchInputs).then((data) {
      setState(() {
        hosts = data;
      });
    });
  }

  void updateSearchFields(dynamic searchInputs) {
    setState(() {
      this.searchInputs = {
        'start': searchInputs['start'],
        'end': searchInputs['end'],
        'address': searchInputs['address'],
        'adults': searchInputs['adults'].toString()
      };
      getAllHosts();
      HostList(
        searchInputs: searchInputs,
      );
    });
  }

  @override
  void initState() {
    getAllHosts();
    super.initState();
  }

  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 2), curve: Curves.linear);
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
                          child: Image.asset("assets/hostPageCover.jpg",
                              fit: BoxFit.cover),
                        ),
                      ),
                      const Positioned(
                        top: 90.0,
                        left: 20,
                        child: Text(
                          'Nos hébergements',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 180),
                    child: HostFilterTab(
                      onChangeField: (dynamic searchInputs) =>
                          updateSearchFields(searchInputs),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "${hosts.length} hébergements trouvés",
                style: TextStyle(
                  fontSize: 24.0,
                  color: titleBlue,
                ),
              ),
            ),
            HostList(
              searchInputs: searchInputs,
            ),
            //footer
            Footer(),
            CreatedBy(),
            BackToTop(scrollToTop),
          ],
        ),
      ),
    );
  }
}

class HostList extends StatefulWidget {
  dynamic searchInputs;

  HostList({Key? key, required this.searchInputs}) : super(key: key);
  @override
  State<HostList> createState() => _HostListState();
}

class _HostListState extends State<HostList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HostCalls.getHostsList(widget.searchInputs),
      builder: (context, AsyncSnapshot<List<Host>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          final List<Host> listHosts = snapshot.data!.toList();

          if (listHosts != null) {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => Container(
                  margin: EdgeInsets.only(bottom: 15, right: 15),
                  child: HostListItem(listHosts[index])),
              itemCount: listHosts.length,
            );
          }
        }

        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(primary),
          ),
        );
      },
    );
  }
}
