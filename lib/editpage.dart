import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kingslabtest/model/product.dart';
import 'dart:convert';
import 'controllers/user_controller.dart';
import 'home/home.dart';
class EditPage extends StatefulWidget {
  late ProductElement productElement;
   EditPage({super.key, required this.productElement });

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  UserController userController = Get.put(UserController());
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController idctrlr = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController.text=widget.productElement!.title;
    //
     priceController.text='${widget.productElement!.price}';
    //
     descriptionController.text=widget.productElement!.description;
    //
     idctrlr.text='${widget.productElement!.id}';
    
  }
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
                controller: titleController,
                decoration: InputDecoration(hintText: 'title'),
            ),
            SizedBox(
               height: 10,
            ),
            TextField(
                controller: priceController,
                decoration: InputDecoration(hintText: 'price'),
            ),
            SizedBox(
                height: 10,
            ),
            TextField(
              controller:descriptionController,
              decoration: InputDecoration(hintText: 'descrpition'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: idctrlr,
              decoration: InputDecoration(hintText: 'id'),
            ),

            SizedBox(
              height: 10,
            ),
           
           
            ElevatedButton(
                onPressed: () async {
                await userController.updateProduct(idctrlr.text.toString(),titleController.text.toString(),int.parse(priceController.text.toString()),"",descriptionController.text.toString());

                Get.to(() => ProductList());
            },
            child: Text('update data'),
            ),

    ]),
      )
    );
  }
}
