import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:simbiotik_test/controller/auth/auth_with_social.dart';
import 'package:simbiotik_test/screens/auth/login.dart';
import 'package:simbiotik_test/screens/foods/foods.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  getHomeScreen() {
    if (SocialAuth.checkSignWithFirebase()) {
      return const FoodsListScreen();
    } else {
      return const LoginScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Practical Test App',
      home: getHomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
