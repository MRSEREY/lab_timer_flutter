import 'package:flutter/material.dart';
import 'package:lap_timer/screens/text_input.dart';
import 'package:lap_timer/screens/timer_screen.dart';
import 'package:lap_timer/widgets/bottom_card_container.dart';
import 'package:lap_timer/widgets/main_action_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  String numberOfLaps = '0';
  String durationPerLap = '0';
  String restDuration = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LAP TIMER"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0xff20bf55),
                Color(0xff01baef),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextInput(
                label: 'Number Of Laps',
                onChanged: (value) {
                  setState(() {
                    numberOfLaps = value;
                  });
                },
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return "Number of Laps is required";
                  }
                  if (int.parse(value!) <= 0) {
                    return "Must be more than 1";
                  }
                },
              ),
              TextInput(
                label: 'Duration Per Laps (Seconds)',
                onChanged: (value) {
                  setState(() {
                    durationPerLap = value;
                  });
                },
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return "Duration Per Laps is required";
                  }
                  if (int.parse(value!) <= 0) {
                    return "Must be more than 1";
                  }
                },
              ),
              TextInput(
                label: 'Rest Duration (Seconds)',
                onChanged: (value) {
                  setState(() {
                    restDuration = value;
                  });
                },
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return "Rest Duration is required";
                  }
                  if (int.parse(value!) <= 0) {
                    return "Must be more than 1";
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomCardContainer(
        child: MainActionButton(
          title: "START",
          textColor: Colors.white,
          onPressed: () {
            if (_formKey.currentState?.validate() == true) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TimerScreen(
                    durationPerLap: int.parse(durationPerLap),
                    restDuration: int.parse(restDuration),
                    numberOfLaps: int.parse(numberOfLaps),
                  ),
                  fullscreenDialog: true,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
