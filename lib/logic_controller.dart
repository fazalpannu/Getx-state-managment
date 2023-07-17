import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart';

class apicontroller extends GetxController {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  RxBool loading = false.obs;
  loginapi() async {
    loading.value = true;
    // Map newdata = {
    //   "name": emailcontroller.text.toString(),
    //   "job": passwordcontroller.text.toString()
    // };//Raw Form Data
    final response = await delete(
      Uri.parse('https://reqres.in/api/users/2'),
      // body: jsonEncode(newdata) Raw Form Data
      body: {
        "name": emailcontroller.text.toString(),
        "job": passwordcontroller.text.toString()
      },
      // headers: {
      //   "fazal": "hello",
      //   "ALi": "pannu"
      // }
    );
    print(response.statusCode);
    if (response.statusCode == 204) {
      loading.value = false;
      Get.snackbar('Login', 'Update');
    } else {
      loading.value = false;
      Get.snackbar('Login', 'Not Update');
    }
  }
}
