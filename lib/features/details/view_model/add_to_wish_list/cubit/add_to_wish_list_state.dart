part of 'add_to_wish_list_cubit.dart';

@immutable
sealed class AddToWishListState {}

final class AddToWishListInitial extends AddToWishListState {}

final class AddToWishListSuccess extends AddToWishListState {
  final AddToWishListModel data;

  AddToWishListSuccess({required this.data});
}

final class AddToWishListLoading extends AddToWishListState {}

final class AddToWishListFailure extends AddToWishListState {
  final String errMassage;

  AddToWishListFailure({required this.errMassage});
}
