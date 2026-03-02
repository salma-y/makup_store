import 'package:bloc/bloc.dart';
import 'package:makeup_store/model/Product_item_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  List<ProductItemModel>_cartItems=[];
  CartBloc() : super(CartState.initial()) {
    on<AddToCartEvent>((event, emit) {
      final index=state.cartItems
          .indexWhere((item) => item.name == event.product.name);
      final cartItems=state.cartItems;
      if(index==-1){
       cartItems.add(event.product);
      }
      final product = cartItems[index];
      final item=product.copyWith(quantity:++product.quantity);
      cartItems[index]=item;

     emit(state.copyWith(
       status: CartStatus.initial,
       cartItems: _cartItems
     ));

    });

    on<IncreaseQuantityEvent>((event, emit) {
    final cartItems = List<ProductItemModel>.from(state.cartItems);
    final index =
    cartItems.indexWhere((item) => item.name == event.productName);

    if (index != -1) {
      final product = cartItems[index];

      cartItems[index] =
          product.copyWith(quantity: product.quantity + 1);

      emit(state.copyWith(
        cartItems: cartItems,
        status: CartStatus.success,
      ));
    }});
    on<DecreaseQuantityEvent>((event, emit) {
      final cartItems = List<ProductItemModel>.from(state.cartItems);

      final index =
      cartItems.indexWhere((item) => item.name == event.productName);

      if (index != -1) {
        final product = cartItems[index];

        if (product.quantity > 1) {
          cartItems[index] =
              product.copyWith(quantity: product.quantity - 1);
        } else {
          cartItems.removeAt(index);
        }

        emit(state.copyWith(
          cartItems: cartItems,
          status: CartStatus.success,
        ));
      }
    });


  }
}
