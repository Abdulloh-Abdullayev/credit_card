import 'package:contact/pages/CardPage.dart';
import 'package:contact/pages/HomePage.dart';
import 'package:contact/services/binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main()async {
  await Hive.initFlutter();
  await Hive.openBox('Hive');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      initialBinding: ControllersBinding(),
      getPages: [
        GetPage(name: "/HomePage", page: () => const HomePage()),
        GetPage(name: "/CardPage", page: () => const CardPage()),
      ],
    );
  }
}


