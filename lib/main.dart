import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:listin/_core/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:listin/firestore/screen/home_screen.dart';
import 'package:listin/authentication/screens/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());

  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  // Produto produto = Produto(
  //     id: '1231hjg31', name: 'Batata', isComprado: true, amount: 1, price: 5.2);

  // firestore
  //     .collection('feiras')
  //     .doc('abcdef')
  //     .collection("produtos")
  //     .doc(produto.id)
  //     .set(produto.toMap());
  // QuerySnapshot<Map<String, dynamic>>? snapshot;
  // List<Produto> temp = [];

  // snapshot ??= await firestore
  //     .collection("feiras")
  //     .doc('abcdef')
  //     .collection("produtos")
  //     .get();

  // for (var doc in snapshot.docs) {
  //   Produto produto = Produto.fromMap(doc.data());
  //   temp.add(produto);
  // }

  // print('olaaa: ${temp[0].price}');
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
      home: const RoteadorTelas(),
    );
  }
}

class RoteadorTelas extends StatelessWidget {
  const RoteadorTelas({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasData) {
            return HomeScreen(
              user: snapshot.data!,
            );
          } else {
            return const AuthScreen();
          }
        }
      },
    );
  }
}
