import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dart:convert';
import 'controllers/user_controller.dart';
class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  UserController userController = Get.put(UserController());
  TextEditingController userIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },),
      ),
      body: Container(
            margin: EdgeInsets.all(20),
            child: ListView(children: [
            TextField(
                controller: userController.titleController,
                decoration: InputDecoration(hintText: 'title'),
            ),
            SizedBox(
               height: 10,
            ),
            TextField(
                controller: userController.priceController,
                decoration: InputDecoration(hintText: 'price'),
            ),
            SizedBox(
                height: 10,
            ),
            TextField(
              controller: userController.descriptionController,
              decoration: InputDecoration(hintText: 'descrpition'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: userController.statusController,
              decoration: InputDecoration(hintText: 'id'),
            ),
            
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                userController.fetchUserData(userIdController.text);
            },
            child: Text('get data'),
            ),
            ElevatedButton(
                onPressed: () {
                userController.updateUserData(userIdController.text);
            },
            child: Text('update data'),
            ),

    ]),
      )
    );
  }
}
