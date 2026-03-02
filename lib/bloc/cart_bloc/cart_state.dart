part of 'cart_bloc.dart';
enum CartStatus {initial,loading,success,failed}
@immutable
 class CartState {
  final List<ProductItemModel> cartItems;
  final CartStatus status;//[contain all states]

 const CartState._({
   this.cartItems=const [],
    this.status=CartStatus.initial,
 });

 factory CartState.initial(){
   return CartState._(
     cartItems:[],
     status:CartStatus.initial,
   );
 }

 CartState copyWith({
   List<ProductItemModel>?cartItems,
   CartStatus? status
 }){
    return CartState._(
      cartItems:cartItems??this.cartItems,
      status:status??this.status,
    );
 }
}

