import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makeup_store/bloc/cart_bloc/cart_bloc.dart';
import '../model/Product_item_model.dart';
import 'home_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final double Delivery = 5.00;
  final double Taxes = 2.50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state.cartItems.isEmpty) {
                return Center(
                  child: Text("no item exist yet"),
                );
              }
              return Column(
                  children: [
                    Expanded(child:
                    ListView.builder(
                        itemCount: state.cartItems.length,
                        itemBuilder: (context, index) {
                          final ProductItemModel product = state
                              .cartItems[index];
                          return ListTile(
                            leading: Image.network(product.link),
                            title: Text(product.name, style: TextStyle(
                                fontWeight: .bold),),
                            subtitle: Text("\$${product.price}"),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      context.read<CartBloc>().add(
                                        DecreaseQuantityEvent(product.name),
                                      );
                                    },
                                    icon: Icon(Icons.remove)),
                                Text(product.quantity.toString()),
                                IconButton(
                                    onPressed: () {
                                      if (product.quantity == 10) {
                                        return;
                                      }
                                     context.read<CartBloc>().add(
                                       IncreaseQuantityEvent(product.name)
                                     );
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
                              Text("\$${calculateTotal(state.cartItems).toStringAsFixed(2)}",)
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
                                style: TextStyle(
                                    fontSize: 20, fontWeight: .bold),),
                              Text("\$${total(state.cartItems,Delivery,Taxes)}",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: .bold),
                              )
                            ],
                          ),
                          GestureDetector(
                              onTap: () {
                                print("Button Clicked!");
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (context) =>
                                      HomeScreen()),
                                      (Route<dynamic> route) => false,
                                );
                              },
                              child: Container(
                                  margin: .all(5),
                                  height: 50,
                                  width: (MediaQuery
                                      .sizeOf(context)
                                      .width * 1),
                                  decoration: BoxDecoration(
                                    borderRadius: .circular(13),
                                    color: Colors.purple.shade300,
                                  ),
                                  child: Center(child: Text("Checkout",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),),
                                  )
                              )
                          )
                        ],
                      ),
                    ),
                  ]
              );
            }
        )
    );
  }

  double calculateTotal(List<ProductItemModel> cartItems) {
    double total = 0.0;
    for (var product in cartItems) {
      total += (product.price * product.quantity);
    }
    return total;
  }

  double total(List<ProductItemModel> cartItems,double Delivery,double Taxes) => Delivery + Taxes + calculateTotal(cartItems);

}

