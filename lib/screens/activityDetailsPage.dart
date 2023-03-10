import 'package:flutter/material.dart';

class ActivityDetailsPage extends StatefulWidget {
  int id;
  ActivityDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  State<ActivityDetailsPage> createState() => _ActivityDetailsPageState();
}

class _ActivityDetailsPageState extends State<ActivityDetailsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  dynamic searchInputs = {'start': '', 'end': '', 'address': '', 'adults': ''};
  bool loading = false;
  bool showFAB = false;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
