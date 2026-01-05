part of 'details_cubit.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}

final class DetailsLoading extends DetailsState {}

final class DetailsSuccess extends DetailsState {
  final ProductDetailsResponse data;

  DetailsSuccess({required this.data});
}

final class DetailsFailure extends DetailsState {
  final String errMassage;

  DetailsFailure({required this.errMassage});
}
