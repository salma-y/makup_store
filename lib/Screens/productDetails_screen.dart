import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeup_store/model/Product_item_model.dart';
import 'package:makeup_store/Screens/cart_screen.dart';

class ProductdetailsScreen extends StatefulWidget {
  final ProductItemModel product;
  const ProductdetailsScreen({super.key,required this.product});
  @override
  State<ProductdetailsScreen> createState() => _ProductdetailsScreenState();
}

class _ProductdetailsScreenState extends State<ProductdetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Image.network(widget.product.link),
          SizedBox(height: 20),
          Row(

           mainAxisAlignment: .spaceBetween,
            children: [
              Text(widget.product.name,style: TextStyle(fontWeight: .w600,fontSize: 20),),
              Text("\$${widget.product.price}",style: TextStyle(fontWeight: .bold,fontSize: 20),),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              SizedBox(width: 10,),
              infoCard(icon: Icons.star, value: "4.8", label: "1k reviews"),
              infoCard(icon: Icons.access_time, value: "2", label: "Days"),
              SizedBox(width: 10,),
            ],
          ),
          SizedBox(height: 10),
          Text(widget.product.disc),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder:(context)=>CartScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFDECEF),
              foregroundColor: Colors.black,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: Text("Add to Cart", style: TextStyle(fontSize: 15)),
          ),
        ],
      )
    );
    
  }
  Widget infoCard({required IconData icon, required String value, required String label, Color iconColor = Colors.orange}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}