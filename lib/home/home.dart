import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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

  Future<Product>? productFuture;

  @override
  void initState(){
    super.initState();
    loadProducts();
  }
  void loadProducts(){
    setState(() {
      productFuture = fetchProducts();
    });
  }
  @override
  Widget build(BuildContext context) {
    const title = 'Home Screen';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Column(
          children: [

            Flexible(


              child: productFuture==null?Text("loading"):FutureBuilder<Product>(
                future: productFuture,
                builder: ( context, snapshot) {
                  if(!snapshot.hasData){
                    return const CircularProgressIndicator();
                  } else if(snapshot.hasError){
                    return Text("Something went wrong, try again later");
                  }
                  else{
                    return ListView.builder(
                      itemCount: snapshot.data!.products.length,
                      itemBuilder: (context, index) {
                        ProductElement productElement = snapshot.data!.products[index];
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => EditPage()));
                            },
                          ),
                        );
                      },
                    );
                  }
                },),
            ),
          ],
        ),
        // body: GridView.count(
        //
        //   crossAxisCount: 2,
        //
        //   children: List.generate(100, (index) {
        //     return Center(
        //       child: Container(
        //         height: 100,
        //         width: 100,
        //         decoration: BoxDecoration(
        //           color: Colors.grey,
        //         ),
        //         child: FutureBuilder(
        //           future: fetchData(),
        //           builder: ( context, snapshot) {
        //             if(!snapshot.hasData){
        //               return const CircularProgressIndicator();
        //             } else if(snapshot.hasError){
        //               return Text("Something went wrong, try again later");
        //             }
        //             else{
        //               return Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children:<Widget> [
        //                   ClipRRect(
        //                     borderRadius: BorderRadius.circular(36),
        //                     child: Image.network(snapshot.data!.data!.thumbnail!),
        //                   ),
        //                   SizedBox(height: 36,),
        //                   Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: [
        //                       Text("Last Name"),
        //                       Text(snapshot.data!.data!.lastName!)
        //                     ],
        //                   ),
        //                   SizedBox(height: 36,),
        //                   Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: [
        //                       Text("Email"),
        //                       Text(snapshot.data!.data!.email!)
        //                     ],
        //                   ),
        //                 ],
        //               );
        //             }
        //           },),
        //       ),
        //     );
        //   }),
        // ),
      ),
    );
  }
}