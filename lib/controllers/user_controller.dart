import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kingslabtest/model/product.dart';

class UserController extends GetxController {
  Product? productModel;
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  fetchUserData(String id) async {
    //getx fetch api data
    var token =
        'YOUR_TOKEN';
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      http.Response response = await http.get(
          Uri.tryParse('https://dummyjson.com/products/${id}')!,
          headers: headers);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result);
        productModel = Product.fromJson(result);
        titleController.text = result['title'];
        priceController.text = result['price'];
        descriptionController.text = result['gender'];
        statusController.text = result['id'];
        //do any task
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print('error $e');
    }
  }

  updateUserData(String userid) async {
    //getx update api data
    var token =
        'YOUR_TOKEN';
    try {
      var body = {
        'title': titleController.text,
        'price': priceController.text,
        'description': descriptionController.text,
        'id': statusController.text,
      };

      http.Response response = await http.put(
        Uri.parse('https://dummyjson.com/products/$userid'),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print('data updated');
        print(json);
      } else {
        print('response status code not 200');
        throw jsonDecode(response.body)['meta']["message"] ??
            "Unknown Error Occured";
      }
    } catch (e) {
      print(e);
    }
  }


}