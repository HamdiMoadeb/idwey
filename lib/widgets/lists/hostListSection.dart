import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idwey/blocs/blocs.dart';
import 'package:idwey/utils/constants.dart';
import 'package:idwey/utils/enums.dart';
import 'package:idwey/widgets/listItems/hostListItem.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../utils/colors.dart';

class HostListSection extends StatefulWidget {
  const HostListSection({
    Key? key,
  }) : super(key: key);

  @override
  State<HostListSection> createState() => _HostListSectionState();
}

class _HostListSectionState extends State<HostListSection> {
  //List<Host> hosts = [];
  final AutoScrollController controller = AutoScrollController();

  int _currentFocusedIndex = 0;

  getAllHosts() {
    context.read<HomePageBloc>().add(const GetSectionHosts());
  }

  @override
  void initState() {
    super.initState();
    getAllHosts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommonBloc, CommonState>(
      listener: (context, commonState) {
        // TODO: implement listener
      },
      builder: (context, commonState) {
        return BlocBuilder<HomePageBloc, HomePageState>(
          builder: (context, state) {
            if (state.status == StateStatus.loading) {
              return const CircularProgressIndicator();
            }
            if (state.status == StateStatus.success) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 15),
                    child: Text(
                      'Logements et maisons d\'hôtes',
                      style: TextStyle(
                        color: primary,
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 10,
                    indent: 15,
                    endIndent: 15,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8, left: 15, right: 15),
                    child: Text(
                      'Vous cherchez où passer la nuit ? Y\'a pas mieux que ces logements de qualité',
                      style: TextStyle(
                        color: grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: Row(
                      children: [
                        Spacer(),
                        Container(
                          width: 30,
                          height: 30,
                          margin: EdgeInsets.only(right: 10),
                          child: ElevatedButton(
                              child: Icon(
                                Icons.navigate_before_sharp,
                                color: primary,
                                size: 25,
                              ),
                              onPressed: () {
                                if (_currentFocusedIndex > 0) {
                                  _currentFocusedIndex--;
                                  controller.scrollToIndex(_currentFocusedIndex,
                                      preferPosition: AutoScrollPosition.begin);

                                  setState(() {});
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shadowColor: Colors.white,
                                shape: CircleBorder(
                                    side: BorderSide(
                                  color: Colors.grey.shade300,
                                )),
                                padding: EdgeInsets.zero,
                                primary: Colors.white,
                              )),
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          child: ElevatedButton(
                              child: Icon(
                                Icons.navigate_next_sharp,
                                color: primary,
                                size: 25,
                              ),
                              onPressed: () {
                                if (_currentFocusedIndex <
                                    state.listHosts!.length - 1) {
                                  _currentFocusedIndex++;
                                  controller.scrollToIndex(_currentFocusedIndex,
                                      preferPosition: AutoScrollPosition.begin);
                                  setState(() {});
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shadowColor: Colors.white,
                                shape: CircleBorder(
                                    side: BorderSide(
                                  color: Colors.grey.shade300,
                                )),
                                padding: EdgeInsets.zero,
                                primary: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 430,
                    margin: EdgeInsets.only(top: 5, bottom: 20, right: 15),
                    child: ListView.builder(
                      controller: controller,
                      physics: PageScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        print("commonState.currentCurrency");
                        print(commonState.currentCurrency);
                        print(currencies);
                        print(currencies[commonState.currentCurrency]['value']);
                        print(
                            currencies[commonState.currentCurrency]['symbol']);
                        return AutoScrollTag(
                          key: ValueKey(index),
                          controller: controller,
                          index: index,
                          child: VisibilityDetector(
                            key: Key(index.toString()),
                            onVisibilityChanged: (VisibilityInfo info) {
                              if (info.visibleFraction == 1) {
                                setState(() {
                                  _currentFocusedIndex = index;
                                });
                              }
                            },
                            child: HostListItem(
                                state.listHosts![index],
                                true,
                                currencies[commonState.currentCurrency]
                                    ['value'],
                                currencies[commonState.currentCurrency]
                                    ['symbol']),
                          ),
                        );
                      },
                      itemCount: state.listHosts?.length,
                    ),
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
        );
      },
    );
  }
}
