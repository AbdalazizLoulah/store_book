import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_book/features/home/data/model/slider_model/slider_model.dart';
import 'package:store_book/features/home/data/repo/slider_repo/home_slider_repo.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit(this.homeSliderRepo) : super(SliderInitial());
  HomeSliderRepo homeSliderRepo;
  Future getSliderData() async {
    emit(SliderLoading());
    var data = await homeSliderRepo.getSliderData();
    data.fold(
      (failure) {
      emit(SliderFailure(errMassage: failure.errMassage));
      },
      (data) {
      emit(SliderSuccess(data: data));
      },
    );
  }
}
