import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_state/controller.dart';
import 'package:getx_state/controller2.dart';

class exammple2 extends StatefulWidget {
  const exammple2({super.key});

  @override
  State<exammple2> createState() => _exammple2State();
}

class _exammple2State extends State<exammple2> {
  final controller2 _controller2 = Get.put(controller2());

  @override
  Widget build(BuildContext context) {
    print('rebuit');
    return Scaffold(
      appBar: AppBar(
        title: Text('example 2 GetX'),
      ),
      body: Column(
        children: [
          Obx(() => Container(
                height: 200,
                width: 100,
                color: Colors.blue.withOpacity(_controller2.opacity.value),
              )),
          Obx(() => Slider(
                value: _controller2.opacity.value,
                onChanged: (value) {
                  _controller2.opacity.value = value;
                  // _controller2.change(value);
                },
              )),
          Obx(() => Switch(
                value: _controller2.swith.value,
                onChanged: (value) {
                  _controller2.swith.value = value;
                },
              ))
        ],
      ),
    );
  }
}
