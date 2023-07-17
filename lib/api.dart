import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_state/logic_controller.dart';

class apigetx extends StatefulWidget {
  const apigetx({super.key});

  @override
  State<apigetx> createState() => _apigetxState();
}

class _apigetxState extends State<apigetx> {
  apicontroller _apicontroller = Get.put(apicontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _apicontroller.emailcontroller,
              decoration: InputDecoration(hintText: 'Enter the email'),
            ),
            TextFormField(
              controller: _apicontroller.passwordcontroller,
              decoration: InputDecoration(hintText: 'Enter the Password'),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(() => TextButton(
                onPressed: () {
                  _apicontroller.loginapi();
                },
                child: _apicontroller.loading.value == true
                    ? CircularProgressIndicator()
                    : Card(child: Text('Login'))))
          ],
        ),
      ),
    );
  }
}
