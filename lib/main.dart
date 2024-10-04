import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quantum_sharks/constants/colors.dart';
import 'package:quantum_sharks/view/page/booking_offline.dart';
import 'package:quantum_sharks/view/page/booking_online.dart';
import 'package:quantum_sharks/view/page/exercise_page.dart';
import 'package:quantum_sharks/view/page/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appBarBackgroundColor,
          title: const Text(
            "Pages",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        body: const Column(
          children: [
            ListTileWidget(
              title: 'Booking Appointment',
              page: BookingAppointment(),
            ),
            ListTileWidget(
              title: 'Online Consult',
              page: BookingOnline(),
            ),
            ListTileWidget(
              title: 'Exercise',
              page: ExercisePage(),
            ),
            ListTileWidget(
              title: 'LoginPage',
              page: LoginScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  final String title;
  final Widget page;

  const ListTileWidget({
    super.key,
    required this.title,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_right),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => page,
        ));
      },
    );
  }
}
