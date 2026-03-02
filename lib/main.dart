import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makeup_store/bloc/cart_bloc/cart_bloc.dart';
import 'Screens/bloc_opserver.dart' show AppBlocObserver;
import 'Screens/products_screen.dart';
import 'Screens/home_screen.dart';

void main() {
 Bloc.observer=AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context)=>CartBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:HomeScreen(),
      ),
    );
  }
}
