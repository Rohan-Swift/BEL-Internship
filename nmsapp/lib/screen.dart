import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import './main.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  DatabaseReference s1 =
      FirebaseDatabase.instance.ref().child('Switch').child('s1');
  DatabaseReference s2 =
      FirebaseDatabase.instance.ref().child('Switch').child('s2');
  int num1 = 0, num2 = 0;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    s1.onValue.listen((DatabaseEvent e) {
      num1 = int.parse(e.snapshot.value.toString());
    });

    s2.onValue.listen((DatabaseEvent f) {
      num2 = int.parse(f.snapshot.value.toString());
    });

    // Color clr() {
    //   if (num1 == 1) {
    //     return Colors.green;
    //   } else {
    //     return Colors.red;
    //   }
    // }

    // Color clr1() {
    //   if (num2 == 1) {
    //     return Colors.green;
    //   } else {
    //     return Colors.red;
    //   }
    // }

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
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: num1 == 1 ? Colors.green : Colors.red,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(40),
                    child: Text(
                      'Switch 1',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: num2 == 1 ? Colors.green : Colors.red,
                  ),
                  child: const Padding(
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
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      s1.onValue.listen((DatabaseEvent e) {
                        num1 = int.parse(e.snapshot.value.toString());
                      });
                      s2.onValue.listen((DatabaseEvent e) {
                        num2 = int.parse(e.snapshot.value.toString());
                      });
                    });
                  },
                  child: const Text('Refresh'),
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
            )
          ],
        ),
      ),
    );
  }
}
