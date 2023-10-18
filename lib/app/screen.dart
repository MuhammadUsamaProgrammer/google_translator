import 'package:flutter/material.dart';
import 'package:google_translator/app/controller.dart';
import 'package:get/get.dart';

class Screen extends StatelessWidget {
  Screen({super.key});
  final GogleTranslater textController = Get.put(GogleTranslater());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onChanged: textController.onTextChange,
              ),
              SizedBox(
                height: 100,
              ),
              Obx(() => Container(
                    height: Get.height * 0.07,
                    width: Get.width * 0.5,
                    child: DropdownButton(
                      items: <String>['en', 'mr', 'ur'].map((String value) {
                        return DropdownMenuItem(
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 20),
                          ),
                          value: value,
                        );
                      }).toList(),
                      onChanged: textController.onLanguageChange,
                      value: textController.choseValue.value,
                    ),
                  )),
              SizedBox(
                height: 100,
              ),
              Obx(() => Text(
                    textController.string.value,
                    style: TextStyle(fontSize: 30),
                  )),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
