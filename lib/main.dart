import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_state/api.dart';
import 'package:getx_state/example2.dart';

import 'package:getx_state/home_screen.dart';
import 'package:getx_state/image_picker.dart';
import 'package:getx_state/image_picker_controller.dart';
import 'package:getx_state/logic_controller.dart';

import 'favouritapp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: imagemanagment(),
    );
  }
}
