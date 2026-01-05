part of 'slider_cubit.dart';

@immutable
sealed class SliderState {}

final class SliderInitial extends SliderState {}

final class SliderSuccess extends SliderState {
  final SliderModel data;

  SliderSuccess({required this.data});
}

final class SliderLoading extends SliderState {}

final class SliderFailure extends SliderState {
  final String errMassage;

  SliderFailure({required this.errMassage});
}
