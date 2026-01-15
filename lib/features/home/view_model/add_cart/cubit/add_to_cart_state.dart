part of 'add_to_cart_cubit.dart';

@immutable
sealed class AddToCartState {}

final class AddToCartInitial extends AddToCartState {}

final class AddToCartLoading extends AddToCartState {}

final class AddToCartSuccess extends AddToCartState {
  final CartModel data;

  AddToCartSuccess({required this.data});
  
}

final class AddToCartFailure extends AddToCartState {
  final String errMassage;

  AddToCartFailure({required this.errMassage});
}
