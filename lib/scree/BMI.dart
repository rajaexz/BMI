// ignore_for_file: file_names

import 'package:bmi/app_style.dart';
import 'package:bmi/scree/reminder.dart';

import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  // Dicrees button
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    int _selectedIndex = 0;
    const TextStyle optionStyle =
        TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    const List<Widget> _widgetOptions = <Widget>[
      Text(
        'Index 0: Home',
        style: optionStyle,
      ),
      Text(
        'Index 1: Business',
        style: optionStyle,
      ),
      Text(
        'Index 2: School',
        style: optionStyle,
      ),
      Text(
        'Index 3: Settings',
        style: optionStyle,
      ),
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0), // here the desired height
        child: AppBar(
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Color.fromARGB(255, 2, 2, 2)),
          title: const Center(
            child: Text('Live Rate',
                style: TextStyle(
                    color: Color.fromARGB(255, 8, 8, 8), fontSize: 30)),
          ),
          backgroundColor: const Color.fromARGB(255, 253, 253, 253),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 200,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 229, 243, 33),
                  Color.fromARGB(255, 255, 139, 6),
                ],
              )),
              child: Row(
                children: const [
                  SizedBox(
                    width: 20,
                  ),

                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    radius: 30,
                    child: Icon(
                      Icons.person,
                      size: 25.0,
                    ), //Text
                  ),
                    SizedBox(
                    width: 10,
                  ),
                 
                ],
              ),
            ),
            ListBody(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.home,
                  ),
                  title: const Text('Page 1'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(
                    Icons.train,
                  ),
                  title: const Text('Page 2'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Divider(),
              ],
            )
          ],
        ),
      ),
      body: SafeArea(
          child: Row(
        children: [
          Expanded(
              child: Container(
            height: 900,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              color: Color.fromARGB(255, 5, 5, 5),
            ),
            child: Column(children: [
              Row(
                children: const [
                  SizedBox(height: 150),
                  Expanded(
                      child: Center(
                    child: Text(
                      'BID',
                      style: TextStyle(
                        color: Color.fromARGB(255, 253, 253, 253),
                        fontSize: 20,
                      ),
                    ),
                  )),
                  Expanded(
                      child: Center(
                    child: Text(
                      'SELL',
                      style: TextStyle(
                          color: Color.fromARGB(255, 253, 253, 253),
                          fontSize: 20),
                    ),
                  ))
                ],
              ),
              // box - 1
              Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: const Color.fromARGB(255, 5, 5, 5),
                      border: Border.all(
                        color: const Color.fromARGB(255, 250, 230, 104),
                        width: 2,
                      )),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'GOLD RTGS ',
                            style: TextStyle(
                              color: Color.fromARGB(255, 253, 253, 253),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.arrow_drop_down,
                              color: Color.fromARGB(255, 250, 230, 104),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              width: 200,
                              height: 40,
                              child: Center(
                                  child: Text('52255',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)))),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 39, 145, 30),
                              )),
                          Container(
                              width: 200,
                              height: 40,
                              child: Center(
                                  child: Text('52255',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)))),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 240, 35, 35),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  )),

              // box - 2
              Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: const Color.fromARGB(255, 5, 5, 5),
                      border: Border.all(
                        color: const Color.fromARGB(255, 250, 230, 104),
                        width: 2,
                      )),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'GOLD RTGS ',
                            style: TextStyle(
                              color: Color.fromARGB(255, 253, 253, 253),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.arrow_drop_down,
                              color: Color.fromARGB(255, 250, 230, 104),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              width: 200,
                              height: 40,
                              child: Center(
                                  child: Text('52255',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)))),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 39, 145, 30),
                              )),
                          Container(
                              width: 200,
                              height: 40,
                              child: Center(
                                  child: Text('52255',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)))),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 240, 35, 35),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  )),
              const SizedBox(height: 20),

              // box - 3
              Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: const Color.fromARGB(255, 5, 5, 5),
                      border: Border.all(
                        color: const Color.fromARGB(255, 250, 230, 104),
                        width: 2,
                      )),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'GOLD RTGS ',
                            style: TextStyle(
                              color: Color.fromARGB(255, 253, 253, 253),
                            ),
                          ),
                          GestureDetector(
                            child: const Icon(
                              Icons.arrow_drop_down,
                              color: Color.fromARGB(255, 250, 230, 104),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              width: 200,
                              height: 40,
                              child: Center(
                                  child: Text(
                                '52255',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              )),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 39, 145, 30),
                              )),
                          Container(
                              width: 200,
                              height: 40,
                              child: Center(
                                  child: Text('52255',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)))),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 240, 35, 35),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ))
            ]),
          )),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 161, 160, 160),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle),
            label: 'Live play',
            backgroundColor: Color.fromARGB(255, 209, 208, 209),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Active Task',
            backgroundColor: Color.fromARGB(255, 209, 208, 209),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_on),
            label: 'MG Catalogs',
            backgroundColor: Color.fromARGB(255, 209, 208, 209),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'My wallet',
            backgroundColor: Color.fromARGB(255, 209, 208, 209),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
            backgroundColor: Color.fromARGB(255, 209, 208, 209),
          ),
        ],
      ),
    );
  }
}
