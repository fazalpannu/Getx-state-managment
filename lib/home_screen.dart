import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state/controller.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  final controller _controller = Get.put(controller());
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    print('rebuilt');
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Totorial'),
      ),
      body: Center(
        child: Column(
          children: [
            Obx(() => Text(
                  _controller.counter.toString(),
                  style: TextStyle(fontSize: 48),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.increment();
        },
        child: Icon(Icons.ad_units),
      ),
    );
  }
}
