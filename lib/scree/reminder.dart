import 'package:bmi/screen/test.dart';
import 'package:flutter/material.dart';

class Reminder extends StatefulWidget {
  const Reminder({Key? key}) : super(key: key);

  @override
  State<Reminder> createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            //S backgroundColor: context.app_style.,
            leading: GestureDetector(
                onTap: () {}, child: const Icon(Icons.nightlight_round)),
            // ignore: prefer_const_literals_to_create_immutables
            actions: [
              const CircleAvatar(
                  //    backgroundImage: AssetImage('profile.jpg'),
                  )
            ]),
        body: const Test());
  }
}
