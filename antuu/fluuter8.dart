import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TTSApp(),
    );
  }
}

class TTSApp extends StatefulWidget {
  @override
  _TTSAppState createState() => _TTSAppState();
}

class _TTSAppState extends State<TTSApp> {
  FlutterTts flutterTts = FlutterTts();
  TextEditingController controller = TextEditingController();

  // SPEAK FUNCTION
  void speak() async {
    if (controller.text.isNotEmpty) {
      await flutterTts.speak(controller.text);
    }
  }

  // STOP FUNCTION
  void stop() async {
    await flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text to Speech"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: "Enter Text",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: speak,
              child: Text("Speak"),
            ),

            ElevatedButton(
              onPressed: stop,
              child: Text("Stop"),
            ),
          ],
        ),
      ),
    );
  }
}