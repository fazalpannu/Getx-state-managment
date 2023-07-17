import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_state/controler.dart';

class favouriteapp extends StatefulWidget {
  const favouriteapp({super.key});

  @override
  State<favouriteapp> createState() => _favouriteappState();
}

class _favouriteappState extends State<favouriteapp> {
  List<String> fruits = ['apple', 'banana', 'orange', 'grape', 'mango'];

  final favouritecontroller favouriteController =
      Get.put(favouritecontroller());
  @override
  Widget build(BuildContext context) {
    print('rebuilt');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Card(
              child: ListView.builder(
                itemCount: fruits.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      onTap: () {
                        if (favouriteController.favourite
                            .contains(fruits[index].toString())) {
                          favouriteController.favourite
                              .remove(fruits[index].toString());
                        } else {
                          favouriteController.favourite
                              .add(fruits[index].toString());
                        }
                      },
                      title: Text(fruits[index].toString()),
                      trailing: Obx(
                        () => Icon(
                          Icons.favorite,
                          color: favouriteController.favourite
                                  .contains(fruits[index].toString())
                              ? Colors.blue
                              : Colors.white,
                        ),
                      ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
