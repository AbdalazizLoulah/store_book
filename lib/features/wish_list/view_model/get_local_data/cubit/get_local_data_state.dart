part of 'get_local_data_cubit.dart';

@immutable
sealed class GetLocalDataState {}

final class GetLocalDataInitial extends GetLocalDataState {}

final class GetLocalDataSuccess extends GetLocalDataState {
  final List< WishListModel> data;

  GetLocalDataSuccess({required this.data});
}

final class GetLocalDataLoading extends GetLocalDataState {}

final class GetLocalDataFailure extends GetLocalDataState {}
