part of 'place_order_cubit.dart';

@immutable
sealed class PlaceOrderState {}

final class PlaceOrderInitial extends PlaceOrderState {}

final class PlaceOrderSuccess extends PlaceOrderState {
  final OrderPlacedModel data;

  PlaceOrderSuccess({required this.data});
}

final class PlaceOrderLoading extends PlaceOrderState {}

final class PlaceOrderFailure extends PlaceOrderState {
  final String errMassage;

  PlaceOrderFailure({required this.errMassage});
}
