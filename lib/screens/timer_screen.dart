import 'package:flutter/material.dart';
import 'package:lap_timer/widgets/bottom_card_container.dart';
import 'package:lap_timer/widgets/main_action_button.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:text_to_speech/text_to_speech.dart';

class TimerScreen extends StatefulWidget {
  final int numberOfLaps;
  final int durationPerLap;
  final int restDuration;
  const TimerScreen({
    Key? key,
    required this.durationPerLap,
    required this.numberOfLaps,
    required this.restDuration,
  }) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int startingLap = 1;
  int durationForDisplay = 0;
  bool isShowRestDuration = true;
  bool isPause = false;
  TextToSpeech tts = TextToSpeech();
  bool isFinished = false;

  final CountdownController _controller = CountdownController(autoStart: true);

  @override
  void didChangeDependencies() async {
    setState(() {
      durationForDisplay = widget.durationPerLap;
    });
    await tts.speak('Lap 1');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$startingLap/${widget.numberOfLaps}"),
        leading: const SizedBox(),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
              firstChild: Text(
                'Duration Per Laps'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),
              ),
              secondChild: Text(
                'Enjoy your rest time!'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.green,
                ),
              ),
              crossFadeState: isShowRestDuration ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
            ),
            const SizedBox(height: 30),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: isShowRestDuration ? Colors.grey.shade300 : Colors.green,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Countdown(
                  controller: _controller,
                  seconds: durationForDisplay,
                  build: (_, double time) {
                    return Text(
                      time.toStringAsFixed(0),
                      style: TextStyle(
                        fontSize: 40,
                        color: isShowRestDuration ? Colors.red : Colors.white,
                      ),
                    );
                  },
                  interval: const Duration(milliseconds: 1000),
                  onFinished: () async {
                    if (widget.numberOfLaps > 1 && startingLap < widget.numberOfLaps && isShowRestDuration) {
                      setState(() {
                        durationForDisplay = widget.restDuration;
                        isShowRestDuration = false;
                      });
                      _controller.restart();
                      await tts.speak('Enjoy your ${widget.restDuration} seconds rest');
                    } else if (startingLap < widget.numberOfLaps) {
                      setState(() {
                        startingLap += 1;
                        durationForDisplay = widget.durationPerLap;
                        isShowRestDuration = true;
                      });
                      _controller.restart();
                      await tts.speak('Lap $startingLap');
                    } else {
                      setState(() {
                        durationForDisplay = 0;
                        _controller.pause();
                        isFinished = true;
                      });
                      await tts.speak('Finished');
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomCardContainer(
        child: Row(
          children: [
            Expanded(
              child: MainActionButton(
                title: isFinished
                    ? "RESTART"
                    : isPause
                        ? "RESUME"
                        : "PAUSE",
                textColor: Colors.white,
                onPressed: () async {
                  if (isFinished) {
                    setState(() {
                      durationForDisplay = widget.durationPerLap;
                      isFinished = false;
                      startingLap = 1;
                      isShowRestDuration = true;
                    });
                    tts.speak("Lap 1");
                    await Future.delayed(const Duration(milliseconds: 100));
                    _controller.restart();
                  } else {
                    setState(() {
                      isPause = !isPause;
                    });
                    if (!isPause) {
                      _controller.resume();
                    } else {
                      _controller.pause();
                    }
                  }
                },
              ),
            ),
            Expanded(
              child: MainActionButton(
                title: "STOP",
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () {
                  _controller.pause();
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
