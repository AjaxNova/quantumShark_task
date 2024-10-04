import 'package:flutter/material.dart';
import 'package:quantum_sharks/constants/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Image(
              height: 25,
              width: 15,
              image: AssetImage('assets/appbar_login_arrow.png')),
        ),
        title: const Text(
          "Online Consult",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center, //
          children: [
            const SizedBox(
              width: double.infinity,
              height: 120,
              child: Image(image: AssetImage('assets/Group 2194.png')),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Login",
              style: TextStyle(fontSize: 27),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Please login to continue our app'),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Patient ID"),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: ' Enter Patient ID...',
                            border: OutlineInputBorder()),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Password"),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: TextField(
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.remove_red_eye_outlined),
                            hintText: ' Enter Password...',
                            border: OutlineInputBorder()),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(color: appBarBackgroundColor),
                child: const Center(
                  child: Text(
                    'Next',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Forgot Password?'),
          ],
        ),
      ),
    ));
  }
}
