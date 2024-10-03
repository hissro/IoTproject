import 'package:final_project/pages/Login/Login.dart';
import 'package:final_project/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Smart Agriculture',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "noura",
          sliderTheme: const SliderThemeData(
            trackShape: RectangularSliderTrackShape(),
            trackHeight: 2.5,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 15.0),
          )),
      home: HomePage()
    );
  }
}


/*

Manahil Mahmoud Garii Bargo 
201700271

Tebian Alargm Mohamed Ahmed Mohamed Omer
201700406

Tasabeeh Abd Alhai Mohammed sabr
201700404

*/
