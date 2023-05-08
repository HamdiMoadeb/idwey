import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idwey/screens/listPages/eventPage.dart';
import 'package:intl/intl.dart';

import '../../models/event.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';

typedef void InputsCallBack(dynamic searchInputs);

class EventFilterTab extends StatefulWidget {
  bool shouldNavigate;
  dynamic defaultInputs;
  ScrollController? scrollController;
  GlobalKey? positionKey;
  List<Location>? listLocation;
  List<String>? cities;

  EventFilterTab(
      {Key? key,
      required this.onChangeField,
      required this.shouldNavigate,
      this.defaultInputs,
      this.scrollController,
      this.positionKey,
      this.listLocation,
      this.cities})
      : super(key: key);

  final InputsCallBack onChangeField;
  @override
  State<EventFilterTab> createState() => _EventFilterTabState();
}

class _EventFilterTabState extends State<EventFilterTab> {
  Map<String, dynamic> searchInputs = {
    'start': '',
    'end': '',
    'address': '',
    'location_id': 0
  };

  int place = 0;
  int selectedIndex = 0;
  String? addressValue;
  int selectedIndexAddress = 0;
  String start = DateFormat('dd/MM/yyyy').format(DateTime.now());
  String end = DateFormat('dd/MM/yyyy').format(
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1),
  );
  String dateRange =
      '${DateFormat('dd/MM/yyyy').format(DateTime.now())} - ${DateFormat('dd/MM/yyyy').format(
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1),
  )}';

  dateTimeRangePicker() async {
    DateTimeRange? picked = await showDateRangePicker(
        context: context,
        firstDate: DateTime.now(),
        saveText: 'Valider',
        confirmText: 'Valider',
        initialEntryMode: DatePickerEntryMode.calendar,
        lastDate: DateTime(DateTime.now().year + 5),
        builder: (context, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 350,
                  maxHeight: 500,
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                        onPrimary: Colors.white, primary: primary),
                  ),
                  child: child!,
                ),
              )
            ],
          );
        });
    if (picked != null) {
      setState(() {
        dateRange =
            '${DateFormat('dd/MM/yyyy').format(picked.start)} - ${DateFormat('dd/MM/yyyy').format(picked.end)}';
        start = '${DateFormat('dd/MM/yyyy').format(picked.start)}';
        end = '${DateFormat('dd/MM/yyyy').format(picked.end)}';
        searchInputs['start'] = start;
        searchInputs['end'] = end;
      });
    }
  }

  @override
  void initState() {
    addressValue = widget.defaultInputs['address'] != ""
        ? widget.defaultInputs['address']
        : "Adresse";
    if (widget.listLocation!.isNotEmpty) {
      selectedIndex = widget.listLocation!.indexWhere(
          (location) => location.id == widget.defaultInputs['location_id']);
      place = widget.listLocation!.elementAt(selectedIndex).id;
    }
    start = widget.defaultInputs['start'] != ""
        ? widget.defaultInputs['start']
        : DateFormat('dd/MM/yyyy').format(DateTime.now());
    end = widget.defaultInputs['end'] != ""
        ? widget.defaultInputs['end']
        : DateFormat('dd/MM/yyyy').format(
            DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day + 1),
          );
    dateRange = '$start - $end';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: 290,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.locationDot,
                  size: 30,
                  color: primaryOrange,
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Adresse',
                      style: TextStyle(
                        color: grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      width: 200,
                      height: 40,
                      child: DropdownButtonFormField(
                        icon: Visibility(
                            visible: false, child: Icon(Icons.arrow_downward)),
                        items: [
                          DropdownMenuItem<String>(
                            value: 'Adresse',
                            child: Text(
                              'Adresse',
                              style: TextStyle(
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ),
                          ...widget.cities!
                              .where((city) => city != 'Adresse')
                              .map<DropdownMenuItem<String>>((String city) {
                            return DropdownMenuItem<String>(
                              value: city,
                              child: Text(
                                city,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }).toList(),
                        ],
                        onChanged: (String? newValue) {
                          setState(() {
                            addressValue = newValue!;
                            selectedIndexAddress =
                                widget.cities!.indexOf(newValue);
                          });
                        },
                        value: addressValue,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.grey.shade200),
                          ),
                          contentPadding:
                              const EdgeInsets.only(top: 5, left: 20),
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.grey.shade200),
                          ),
                          hintText: "Adresse",
                          fillColor: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 3),
            const Divider(thickness: 1),
            const SizedBox(height: 3),
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.mapLocationDot,
                  size: 27,
                  color: primaryOrange,
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Emplacement',
                      style: TextStyle(
                        color: grey,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width - 80,
                      child: Row(
                        children: [
                          Expanded(
                            child: DropdownButton<int>(
                              iconEnabledColor: primaryOrange,
                              underline: Container(),
                              items: widget.listLocation!
                                  .map((location) => DropdownMenuItem<int>(
                                        value: location.id,
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              130,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  location.name,
                                                  style: TextStyle(
                                                    color: primaryOrange,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              value: place,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedIndex =
                                      widget.listLocation!.indexWhere(
                                    (location) => location.id == newValue,
                                  );
                                  place = widget.listLocation!
                                      .elementAt(selectedIndex)
                                      .id;
                                });
                                print(place);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Divider(thickness: 1),
            const SizedBox(height: 3),
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.solidClock,
                  size: 28,
                  color: primaryOrange,
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'De - à',
                      style: TextStyle(
                        color: grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 2),
                    GestureDetector(
                      onTap: () {
                        dateTimeRangePicker();
                      },
                      child: Text(
                        dateRange,
                        style: TextStyle(
                          color: primaryOrange,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 3),
            const Divider(thickness: 1),
            const SizedBox(height: 3),
            Row(
              children: [
                if (widget.shouldNavigate == false)
                  SizedBox(
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        setState(() {
                          start =
                              '${DateFormat('dd/MM/yyyy').format(DateTime.now())}';
                          end =
                              '${DateFormat('dd/MM/yyyy').format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1))}';
                          dateRange = '${start} - ${end}';
                          addressValue = "Adresse";
                          place = 0;
                          searchInputs = {
                            'start': '',
                            'end': '',
                            'address': "",
                            'location_id': ""
                          };
                        });
                        widget.onChangeField(searchInputs);
                        if (!widget.shouldNavigate)
                          Scrollable.ensureVisible(
                              widget.positionKey!.currentContext!,
                              duration: const Duration(seconds: 1),
                              curve: Curves.linear);
                      },
                      child: const Text(
                        'Vider les champs',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(primaryOrange),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: primaryOrange),
                          ),
                        ),
                      ),
                    ),
                  ),
                const Spacer(),
                SizedBox(
                  height: 35,
                  child: ElevatedButton(
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();

                      setState(() {
                        searchInputs['address'] =
                            addressValue == "Adresse" ? "" : addressValue;
                        searchInputs['location_id'] = place;
                      });
                      if (widget.shouldNavigate) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EventPage(
                                searchInputs: searchInputs,
                                cities: widget.cities,
                                listLocations: widget.listLocation,
                              ),
                            ));
                      }
                      if (!widget.shouldNavigate) {
                        Scrollable.ensureVisible(
                            widget.positionKey!.currentContext!,
                            duration: const Duration(seconds: 1),
                            curve: Curves.linear);
                      }
                      widget.onChangeField(searchInputs);
                    },
                    child: const Text(
                      'RECHERCHER',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(primaryOrange),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(color: primaryOrange),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
