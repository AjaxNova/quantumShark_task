import 'package:flutter/material.dart';
import 'package:quantum_sharks/constants/colors.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: appBarBackgroundColor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text(
          "Exercise",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text("Your Exercise video"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("Exercise : Exercise Name"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Image(
                width: double.infinity,
                fit: BoxFit.cover,
                image: AssetImage('assets/exercise_3.png')),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("Days of week"),
                    SizedBox(
                        height: 25,
                        width: 120,
                        child: TextField(
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ))
                  ],
                ),
                Column(
                  children: [
                    Text("Targeting Muscle"),
                    SizedBox(
                        height: 25,
                        width: 120,
                        child: TextField(
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ))
                  ],
                ),
                Column(
                  children: [
                    Text("Targeting Joint"),
                    SizedBox(
                        height: 25,
                        width: 120,
                        child: TextField(
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ))
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("Exercise : Exercise Name"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Image(
                width: double.infinity,
                fit: BoxFit.cover,
                image: AssetImage('assets/exercise_2.png')),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("Days of week"),
                    SizedBox(
                        height: 25,
                        width: 120,
                        child: TextField(
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ))
                  ],
                ),
                Column(
                  children: [
                    Text("Targeting Muscle"),
                    SizedBox(
                        height: 25,
                        width: 120,
                        child: TextField(
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ))
                  ],
                ),
                Column(
                  children: [
                    Text("Targeting Joint"),
                    SizedBox(
                        height: 25,
                        width: 120,
                        child: TextField(
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
