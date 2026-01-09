part of 'up_date_profile_cubit.dart';

@immutable
sealed class UpDateProfileState {}

final class UpDateProfileInitial extends UpDateProfileState {}

final class UpDateProfileSuccess extends UpDateProfileState {
  final UpdateProfileModel data;

  UpDateProfileSuccess({required this.data});
}

final class UpDateProfileLoading extends UpDateProfileState {}

final class UpDateProfileFailure extends UpDateProfileState {
  final String errMassage;

  UpDateProfileFailure({required this.errMassage});
}
