import 'package:flutter/material.dart';
import 'Product_item_model.dart';
import 'home_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final double Delivery=5.00;
 final double Taxes=2.50;
 List<ProductItemModel> combinedList=[...ProductItemModel.lipProductsList,...ProductItemModel.skinProductsList];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(),
        body: Column(
      children:[
        Expanded(child:
        ListView.builder(
         itemCount:combinedList.length,
          itemBuilder:( context,index) {
           final ProductItemModel product = combinedList[index];
            return ListTile(
             leading: Image.network(product.link),
              title: Text(product.name, style: TextStyle(fontWeight: .bold),),
              subtitle: Text("\$${product.price}"),
               trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      if (product.quantity == 1) {
                        return;
                      }
                      setState(() {
                        product.quantity--;
                      });
                    },
                    icon: Icon(Icons.remove)),
                Text(product.quantity.toString()),
                IconButton(
                    onPressed: () {
                      if (product.quantity == 10) {
                        return;
                      }
                      setState(() {
                        product.quantity++;
                      });
                    },
                    icon: Icon(Icons.add))
              ],
            ),

           );
          }
         )
        ),
       Container(
         margin: .all(10),
         child: Column(
           spacing: 2,
           children: [
             Row(
               mainAxisAlignment: .spaceBetween,
               children: [
                 Text("Subtotal"),
                 Text("\$${calculateTotal().toStringAsFixed(2)}",)
               ],
             ),
             Row(
               mainAxisAlignment: .spaceBetween,
               children: [
                 Text("Delivery"),
                 Text("\$${Delivery}"),
               ],
             ),
             Row(
               mainAxisAlignment: .spaceBetween,
               children: [
                 Text("Taxes"),
                 Text("\$${Taxes}")
               ],
             ),
             Row(
               mainAxisAlignment: .spaceBetween,
               children: [
                 Text("Total",
                   style:TextStyle(fontSize: 20,fontWeight: .bold),),
                 Text("\$${total()}",
                   style: TextStyle(fontSize: 20,fontWeight: .bold),
                 )
               ],
             ),
         GestureDetector(
           onTap: () {
             print("Button Clicked!");
             Navigator.of(context).pushAndRemoveUntil(
                 MaterialPageRoute(builder: (context)=>HomeScreen()),
             (Route<dynamic> route) => false,
             );
           },
           child:Container(
             margin: .all(5),
               height: 50,
               width:(MediaQuery.sizeOf(context).width*1),
               decoration: BoxDecoration(
                 borderRadius: .circular(13),
                 color: Colors.purple.shade300,
               ),
               child:Center(child:  Text("Checkout",style: TextStyle(color: Colors.white,fontSize: 20),),
               )
             )
           )
           ],
         ),
       ), 
       ]
        )
    );
  }

  double calculateTotal() {
    double total = 0.0;
    for (var product in ProductItemModel.lipProductsList) {
      total += (product.price * product.quantity);
    }
    return total;
  }
  double total()=>Delivery+Taxes+calculateTotal();
}