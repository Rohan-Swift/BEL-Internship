import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './main.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Signed in as ',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              user.email!,
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginUI(),
                  ),
                );
              },
              child: const Text(
                'Signout',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Padding(
                    padding: EdgeInsets.all(40),
                    child: Text(
                      'Switch 1',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.green),
                  child: Padding(
                    padding: EdgeInsets.all(40),
                    child: Text(
                      'Switch 2',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Made using',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                FlutterLogo(
                  size: 40,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
