import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_book/features/details/data/model/all_product_model/product_details_respons.dart';
import 'package:store_book/features/details/data/repo/details_repo.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this.detailsRepo) : super(DetailsInitial());
  final DetailsRepo detailsRepo;
  Future getAllDetails(int id) async {
    emit(DetailsLoading());
    var data = await detailsRepo.getDetailsBook(id);
    data.fold(
      (failure) {
        emit(DetailsFailure(errMassage: failure.errMassage));
      },
      (data) {
        emit(DetailsSuccess(data: data));
      },
    );
  }
}
