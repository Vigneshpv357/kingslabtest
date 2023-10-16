import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kingslabtest/model/product.dart';


Future<Product> fetchProducts() async{
  var  url = Uri.parse("https://dummyjson.com/products");
  try{
    var response = await http.get(url);
    if(response.statusCode==200){
      return Product.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception('Something went wrong, try again later');
    }

  }catch(e) {
    throw Exception(e);
  }
}