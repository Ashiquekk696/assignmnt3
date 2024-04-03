import 'package:assignment3/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Obx(() => Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  TextField(
                    controller: controller.textEditingController,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        onPressed: () {
                          controller.getBalancedSubstrings(
                              controller.textEditingController.text);
                        },
                        child: Text("Submit")),
                  ),
                  Text(controller.output.value.toString() ?? "No data")
                ],
              ),
            )));
  }
}
