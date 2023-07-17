// ignore_for_file: unrelated_type_equality_checks

import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_state/image_picker_controller.dart';

class imagemanagment extends StatefulWidget {
  const imagemanagment({super.key});

  @override
  State<imagemanagment> createState() => _imagemanagmentState();
}

class _imagemanagmentState extends State<imagemanagment> {
  imagepicker _imagepicker = Get.put(imagepicker());
  String? allah;
  // Future<int> faza() async {
  //   shsre(_imagepicker.imagepath.toString());

  //   return 1;
  // }
  ali() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Retrieve data
    String f = await prefs.getString('image') ?? '';

    _imagepicker.storedValue.value = f;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ali();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
      ),
      body: Column(
        children: [
          Obx(
            () => InkWell(
                onTap: () {
                  _imagepicker.getimage();
                },
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1),
                    ),
                    height: 100,
                    width: 100,
                    child: _imagepicker.imagepath.isNotEmpty
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.file(
                              File(_imagepicker.imagepath.toString()),
                              fit: BoxFit.cover,
                            ),
                          )
                        : Container(
                            child: Text('Pick Image'),
                          ),
                  ),
                )), // Placeholder widget when imagepath is empty
          ),
          Obx(
            () => Container(
              height: 100,
              width: 100,
              child: _imagepicker.storedValue.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(
                        File(_imagepicker.storedValue.value.toString()),
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      child: Text('not available'),
                    ),
            ),
          ) // Placeholder widget when imagepath is empty
        ],
      ),
    );
  }
}
