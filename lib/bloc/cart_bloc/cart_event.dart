part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class AddToCartEvent implements CartEvent{
  final ProductItemModel product;

  AddToCartEvent(this.product);
}

class IncreaseQuantityEvent implements CartEvent{
  final String productName;

  IncreaseQuantityEvent(this.productName);
}

class DecreaseQuantityEvent implements CartEvent{
  final String productName;

  DecreaseQuantityEvent(this.productName);
}