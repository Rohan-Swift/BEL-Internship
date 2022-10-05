import 'package:flutter/material.dart';
import 'main.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bharat Electronics Limited '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Made using',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                FlutterLogo(size: 70),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
