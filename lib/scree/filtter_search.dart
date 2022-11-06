import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class FilterSearch extends StatefulWidget {
  FilterSearch({Key? key}) : super(key: key);

  @override
  State<FilterSearch> createState() => _FilterSearchState();
}

class _FilterSearchState extends State<FilterSearch> {
  late Future<dynamic> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchWebSite();
  }

  DateTime dateRange = DateTime.now();
  DateTime endRange = DateTime.now();
  //DateTime overDate = DateTime.now();

  Future _show(BuildContext context) async {
    DateTime? datePicker = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: dateRange,
      firstDate: DateTime(1999),
      lastDate: DateTime(2060),
      context: context,
    );
    if (datePicker != null &&
        datePicker != dateRange &&
        datePicker != endRange) {
      setState(() {
        dateRange = datePicker;
      });
    }
  }

  Future _end(BuildContext context) async {
    DateTime? endDatePicker = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: endRange,
      firstDate: DateTime(1999),
      lastDate: DateTime(2060),
      context: context,
    );
    if (endDatePicker != null && endDatePicker != endRange) {
      setState(() {
        endRange = endDatePicker;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final start = dateRange;
    final end = endRange;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFF0D47A1),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Welcome ',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF0D47A1),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Search Field',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              )),
                          // can add more TextSpans here...
                        ],
                      ),
                    )
                  ],
                ),

                // Date Range Select
                SizedBox(
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: 200,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 25),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50)),
                          color: Color(0xFF0D47A1),
                        ),
                        child: const Text(
                          'Date Range Select',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.zero,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      _show(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xFFF5F5F5),
                                      elevation: 0,
                                    ),
                                    label: Text(
                                        '${start.day}/ ${start.month}/ ${start.year}',
                                        style: const TextStyle(
                                            color: Colors.black)),
                                    icon: const Icon(
                                      Icons.calendar_month,
                                      size: 24.0,
                                      color: Color(0xFF0D47A1),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    'Start Date',
                                    style: TextStyle(fontSize: 11),
                                  )
                                ],
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  _end(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xFFF5F5F5),
                                  elevation: 0,
                                ),
                                label: Text(
                                    '${end.day}/ ${end.month}/ ${end.year}',
                                    style:
                                        const TextStyle(color: Colors.black)),
                                icon: const Icon(
                                  Icons.calendar_month,
                                  size: 24.0,
                                  color: Color(0xFF0D47A1),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'End Date',
                                style: TextStyle(fontSize: 11),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                SizedBox(
                    height: 400,
                    width: 400,
                    child: FutureBuilder<dynamic>(
                        future: futureAlbum,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            SearchFormData data =
                                SearchFormData.fromJson(snapshot.data);
                            /*    var websites = data.websites?.length ?? 0;
                                   var states = data.states?.length ?? 0;
                                   var categories = data.categories?.length ?? 0;*/

                            List<String> websitesStringList = data.websites
                                    ?.map((e) => e.value ?? '')
                                    .toList() ??
                                [];
                            List<String> statesStringList = data.states
                                    ?.map((e) => e.value ?? '')
                                    .toList() ??
                                [];
                            List<String> categoriesStringList = data.categories
                                    ?.map((e) => e.value ?? '')
                                    .toList() ??
                                [];

                            return ListView(
                              children: [
                                CustomDropdown(
                                  values: websitesStringList,
                                  dropDownLabel: 'Select websites',
                                ),
                                CustomDropdown(
                                  values: statesStringList,
                                  dropDownLabel: 'Select states',
                                ),
                                CustomDropdown(
                                  values: categoriesStringList,
                                  dropDownLabel: 'Select categories',
                                ),
                              ],
                            );
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          } else {
                            return const CircularProgressIndicator();
                          }
                        })),

                //submit button

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        SnackBar(
                          content: const Text('Yay! A SnackBar!'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        );
                        //   ScaffoldMessenger.of(context).showSnackBar();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 25),
                        decoration: const BoxDecoration(
                          color: Color(0xFF0D47A1),
                        ),
                        child: const Text(
                          'Summit',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFF5F5F5),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDropdown extends StatefulWidget {
  final List<String> values;
  final String dropDownLabel;

  const CustomDropdown(
      {Key? key, required this.values, required this.dropDownLabel})
      : super(key: key);

  static storeData(allDataToList) {
    return allDataToList;
  }

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  List<String> _selectedItems = [];

  void _showMultiSelect() async {
    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: widget.values);
      },
    );

    @override
    void initState() {
      super.initState();
    }

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // use this button to open the multi-select dialog
        ElevatedButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 60, vertical: 15)),
              //backgroundColor:MaterialStateProperty.all(const Color(0xFFF5F5F5)),
              backgroundColor: MaterialStateProperty.all(Colors.blue[600]),
              elevation: MaterialStateProperty.all(0)),
          onPressed: _showMultiSelect,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.dropDownLabel,
                style: const TextStyle(color: Colors.black),
              ),
              const Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
              ),
            ],
          ),
        ),
        const Divider(
          height: 30,
        ),
        // display selected items
        Wrap(
          children: _selectedItems
              .map((e) => Chip(
                    label: Text(e),
                  ))
              .toList(),
        )
      ],
    );
  }
}

//MultiSelect Class  checkbox is checked or
class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  // this variable holds the selected items or Cancel button is pressed or Submit button is tapped
  final List<String> _selectedItems = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Topics'),
      content: SingleChildScrollView(
          child: ListBody(
        children: widget.items
            .map((item) => CheckboxListTile(
                  value: _selectedItems.contains(item),
                  title: Text(item),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (isChecked) => _itemChange(item, isChecked!),
                ))
            .toList(),
      )),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Submit'),
        ),
      ],
    );
  }
}

Future fetchWebSite() async {
  var response = await http.get(Uri.parse(
      'http://192.168.0.173:5001/WeatherForecast/GetAuctionUIFormData'));

  print('response from api : $response');

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('some is a Exception');
  }
}

class SearchFormData {
  List<IdValue>? websites;
  List<IdValue>? states;
  List<IdValue>? categories;
  SearchFormData(
      {required this.websites, required this.states, required this.categories});

  SearchFormData.fromJson(Map<String, dynamic> json) {
    websites =
        List<IdValue>.from(json["websites"].map((x) => IdValue.fromJson(x)));
    states = List<IdValue>.from(json["states"].map((x) => IdValue.fromJson(x)));
    categories =
        List<IdValue>.from(json["categories"].map((x) => IdValue.fromJson(x)));
  }
}

class IdValue {
  final int? id;
  final String? value;
  const IdValue({
    required this.id,
    required this.value,
  });
  factory IdValue.fromJson(Map<String, dynamic> json) {
    return IdValue(
      id: json['id'] as int,
      value: json['value'] as String,
    );
  }
}
