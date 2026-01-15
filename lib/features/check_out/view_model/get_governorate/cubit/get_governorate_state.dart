part of 'get_governorate_cubit.dart';

@immutable
sealed class GetGovernorateState {}

final class GetGovernorateInitial extends GetGovernorateState {}

final class GetGovernorateLoading extends GetGovernorateState {}

final class GetGovernorateSuccess extends GetGovernorateState {
  final GovernoratesResponse data;

  GetGovernorateSuccess({required this.data});
}

final class GetGovernorateFailure extends GetGovernorateState {
  final String errMassage;

  GetGovernorateFailure({required this.errMassage});
}
