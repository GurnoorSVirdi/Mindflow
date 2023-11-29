import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mindflow_frontend/widgets/session_header.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:permission_handler/permission_handler.dart';

enum PromptType {
  intro,
  repsonse,
}

enum AnimationType {
  listening,
  speaking,
}

class SessionPage extends StatefulWidget {
  const SessionPage({super.key});

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Column(
          children: [
            SessionHeader(
                button1_title: "Cancel",
                button2_title: "Finish",
                header_title: "Freeform",
                button1_func: () => context.pop(),
                button2_func: () {}),
            SessionContent()
          ],
        ),
      ),
    );
  }
}

class SessionContent extends StatefulWidget {
  SessionContent({super.key});

  @override
  State<SessionContent> createState() => _SessionContentState();
}

class _SessionContentState extends State<SessionContent> {
  PromptType promptType = PromptType.intro;
  AnimationType animationType = AnimationType.listening;

  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = '';
  double _confidence = 1.0;

  @override
  void initState() {
    // TODO: implement initState
    _speech = stt.SpeechToText();
    _listen();

    super.initState();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_text != '') {
      animationType = AnimationType.speaking;
      setState(() {});
    }

    return Expanded(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        child: Container(
            color: const Color.fromARGB(246, 242, 242, 239),
            padding: const EdgeInsets.all(32),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (promptType == PromptType.intro)
                      ? const StartPrompt()
                      : const Text("GPT Response"),
                  (animationType == AnimationType.listening)
                      ? const ListenAnimation()
                      : SpeakAnimation(onPressed: () {
                          animationType = AnimationType.listening;
                          //empty text buffer and send to API
                          _text = '';
                          setState(() {});
                        }),
                  (animationType == AnimationType.listening)
                      ? const SizedBox(
                          height: 16,
                        )
                      : SizedBox(
                          height: 16,
                          child: Text(
                            "Tap when done",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.values[4],
                              color: const Color.fromARGB(248, 148, 130, 255),
                            ),
                          )),
                  /*FloatingActionButton(
                      onPressed: _listen,
                      child: Icon(_isListening ? Icons.mic : Icons.mic_none))*/

                  /*Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.grey,
                    child: Text(
                      "$_buffer",
                      style: TextStyle(fontSize: 16),
                    ),
                  )*/
                ],
              ),
            )),
      ),
    );
  }
}

class StartPrompt extends StatelessWidget {
  const StartPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Start Speaking",
          style: TextStyle(
            fontSize: 28,
            color: Colors.grey,
            fontWeight: FontWeight.values[4],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 48,
        ),
        Text(
          "Afterwards, MindFlow will help you understand your thoughts.",
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
            fontWeight: FontWeight.values[4],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "For example, you can start with \"I'm feeling like...\"",
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
            fontWeight: FontWeight.values[4],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class ListenAnimation extends StatelessWidget {
  const ListenAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(248, 252, 171, 124),
            borderRadius: BorderRadius.circular(200),
            border: Border.all(
                color: const Color.fromARGB(248, 254, 228, 213), width: 20)),
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.width * 0.5,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                child: Icon(Icons.mic, size: 30, color: Colors.white)),
            LoadingAnimationWidget.waveDots(
              color: Colors.white,
              size: 80,
            ),
          ],
        )));
  }
}

class SpeakAnimation extends StatelessWidget {
  const SpeakAnimation({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onPressed();
      },
      padding: EdgeInsets.zero,
      child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(248, 148, 130, 255),
              borderRadius: BorderRadius.circular(200),
              border: Border.all(
                  color: Color.fromARGB(248, 219, 213, 255), width: 20)),
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.width * 0.5,
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.white,
                size: 80,
              ),
            ],
          ))),
    );
  }
}
