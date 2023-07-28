import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:listin/_core/my_colors.dart';
import 'package:listin/firestore/presentation/home_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listin - Lista Colaborativa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MyColors.brown,
        useMaterial3: false,
        scaffoldBackgroundColor: MyColors.green,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: MyColors.red,
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: MyColors.blue,
        ),
        appBarTheme: const AppBarTheme(
          toolbarHeight: 72,
          centerTitle: true,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(32),
            ),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
