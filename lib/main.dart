import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kasama_towers_lodge/utils/colors.dart';
import 'package:kasama_towers_lodge/views/page_anchor.dart';
import 'package:kasama_towers_lodge/views/signin/sign_in.dart';


void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Room Reserve',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Karas.primary),
        useMaterial3: true,
      ),
      home: PageAnchor() //SignIn()
    );
  }
}