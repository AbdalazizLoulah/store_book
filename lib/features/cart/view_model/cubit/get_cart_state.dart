part of 'get_cart_cubit.dart';

@immutable
sealed class GetCartState {}

final class GetCartInitial extends GetCartState {}

final class GetCartSuccess extends GetCartState {
  final CartModel data;

  GetCartSuccess({required this.data});
}

final class GetCartLoading extends GetCartState {}

final class GetCartFailure extends GetCartState {
  final String errMassage;

  GetCartFailure({required this.errMassage});
}
