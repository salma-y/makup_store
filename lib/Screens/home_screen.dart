

 import 'package:flutter/material.dart';
import 'package:makeup_store/Screens/cart_screen.dart';
 import 'products_screen.dart';
 import 'Wishlist_screen.dart';
 import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  const HomeScreen({super.key});
}
  class _HomeScreenState extends State<HomeScreen>{
  int _activeindex=0;
 final List<Widget>body=const[
      ProductsScreen(),
      Wishlist(),
      CartScreen(),
      ProfileScreen(),
     ];
  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(title:Text("MakeUp Store",style: TextStyle(fontWeight: .bold,fontSize: 25),),
  centerTitle: true,
  actions: [
  IconButton(
  onPressed:(){},
  icon: Icon(Icons.shopping_cart),
  )
  ]
  ),
  body: body[_activeindex],
  bottomNavigationBar:BottomNavigationBar(
  selectedItemColor: Colors.black,
  type: .fixed,
  currentIndex:_activeindex ,
  onTap:(index){ // Anounymas callback function
  setState((){
  _activeindex=index;
  });
  },
  items:[
  BottomNavigationBarItem(icon: Icon(Icons.home_outlined),
  label: "Home"),
  BottomNavigationBarItem(icon: Icon(Icons.favorite_outline),
  label: "Wishlist"),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined),
     label: "cart"),
  BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),
  label: "Profile"),


  ]

  ) ,
  );
  }
  }
