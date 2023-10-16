import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiCall extends StatefulWidget {
  const ApiCall({super.key});

  @override
  State<ApiCall> createState() => _ApiCallState();
}

class _ApiCallState extends State<ApiCall> {
  String? stringResponse;
  @override
  void initState(){
    getData();
    super.initState();
  }
  Future<Map<String,dynamic>> getData() async
  {
    final response = await http.get(Uri.parse("https://reqres.in/api/users/2"));
    return jsonDecode(response.body);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Call Example"),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: ( context,snapshot)
        {
          if(snapshot.hasData){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text((snapshot.data as Map)["data"].toString())),
            );
          }
          else
          {
            return CircularProgressIndicator();
          }
        },

      ),
    );
  }
}
