part of 'get_wish_list_cubit.dart';

@immutable
sealed class GetWishListState {}

final class GetWishListInitial extends GetWishListState {}

final class GetWishListSuccess extends GetWishListState {
  final WishListModel data;

  GetWishListSuccess({required this.data});
}

final class GetWishListLoading extends GetWishListState {}

final class GetWishListFailure extends GetWishListState {
  final String errMassage;

  GetWishListFailure({required this.errMassage});

}
