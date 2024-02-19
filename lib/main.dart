import 'package:day_1/pages/landingPage.dart';
import 'package:day_1/pages/settings.dart';
import 'package:flutter/material.dart';

// import 'package:hive/hive.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  // var box = Hive.box("so");
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      // initialRoute: MainPage.id,

      routes: {
        landingPage.id: (context) => landingPage(),
        Settings.id: (context) => const Settings()
      },
    );
  }
}

class MainPage extends StatelessWidget {
  static String id = 'LoginPage';
  MainPage({
    super.key,
  });
  double newHeight = 100;
  // double newHeight = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(

              // color: Colors.blueAccent,
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(
                    "assets/picc2.jpg",
                  ))),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.greenAccent.withOpacity(0.2),
                ]),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 500,
            width: double.infinity,
            // color: Colors.purple,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Text(
                    "Welcome to the Adventures of Norland",
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const Text(
                    "The New Age",
                    style: TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  InputClass(givenHint: "Enter Username or Email Acoount"),
                  const SizedBox(
                    height: 20,
                  ),
                  InputClass(
                    showPassword: true,
                    givenHint: "Enter your Password",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: ElevatedButton.icon(
                        // style: ButtonStyle(minimumSize: Size.fromWidth(30)),
                        onPressed: () {
                          Navigator.popAndPushNamed(context, landingPage.id);
                        },
                        icon: const Icon(Icons.motion_photos_auto_rounded),
                        label: const Text("Log In")),
                  )
                ],
              ),
            ),
          ),
        )
        // Positioned(a, child: newBox(newHeight: newHeight)),
      ],
    ));
  }
}

class InputClass extends StatelessWidget {
  String givenHint;
  bool? showPassword;

  InputClass({super.key, this.showPassword, required this.givenHint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        obscureText: showPassword ?? false,
        decoration: InputDecoration(
            hintText: givenHint!,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(22))),
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}

class newBox extends StatelessWidget {
  Color? newColor;
  newBox({super.key, this.newColor, required this.newHeight});

  final double newHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: newHeight,
      height: newHeight,
      color: newColor ?? Colors.red,
    );
  }
}
