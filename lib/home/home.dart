import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/user_controller.dart';
import '../editpage.dart';
import '../model/product.dart';
import 'gol.dart';

class ProductList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
   return ProductListState();
  }

}


  class  ProductListState extends State<ProductList>{


  UserController userController = Get.put(UserController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }
Future<void> fetch() async {
  await userController.getproducts();
}
  @override
  Widget build(BuildContext context) {
    userController.getproducts();

    const title = 'Home Screen';
    return  Scaffold(
      body:  Mylist(),
    );
  }
}




class Mylist extends StatelessWidget {
  const Mylist({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
   var p= userController.products;
    return ListView.builder(
      itemCount: p.length,
      itemBuilder: (context, index) {
        ProductElement productElement = p[index];
        return Container(

          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey,width: 1)
          ),
          child: InkWell(

            child: Row(
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child:  Image.network(productElement.thumbnail),
                ),
                Expanded(flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(productElement.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text(productElement.description,),
                        Text("${productElement.price}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.green[700]),)
                      ],
                    ),
                  ),
                )

              ],
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditPage(productElement:productElement)));
            },
          ),
        );
      },
    );
  }
}
