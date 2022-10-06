import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './main.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final email = TextEditingController();
  final password = TextEditingController();

  Future signup() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email.text.trim(),
      password: password.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bharat Electronics Limited'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "REGISTER",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Enter Username",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.contact_mail_rounded),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                  decoration: const InputDecoration(
                    labelText: "Enter Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Enter Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: const LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.green,
                      ],
                    ),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      signup();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginUI(),
                        ),
                      );
                    },
                    child: const Text(
                      "REGISTER",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  height: 30,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginUI(),
                          ),
                        ); // Navigator
                      },
                      child: const Text("Sign in"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
