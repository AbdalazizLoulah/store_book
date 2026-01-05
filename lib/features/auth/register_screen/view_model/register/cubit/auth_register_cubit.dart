import 'package:bloc/bloc.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';
import 'package:store_book/features/auth/register_screen/data/model/register_model.dart';
import 'package:store_book/features/auth/register_screen/data/repo/register_repo.dart';

part 'auth_register_state.dart';

class AuthRegisterCubit extends Cubit<AuthRegisterState> {
  AuthRegisterCubit(this.registerRepo) : super(AuthRegisterInitial());
  RegisterRepo registerRepo;
  Future authRegister({
    required String name,
    required String email,
    required String password,
    required String passwordConform,
  }) async {
    // final hasConnection =
    //     await InternetConnectionChecker.instance.hasConnection;
    // if (!hasConnection) {
    //   emit(AuthRegisterFailure(errMassage: '❌ لا يوجد اتصال بالإنترنت'));
    //   return;
    // } else {
      emit(AuthRegisterLoading());
      var res = await registerRepo.register(
        name,
        email,
        password,
        passwordConform,
      );
      res.fold(
        (failure) {
          emit(AuthRegisterFailure(errMassage: failure.errMassage));
        },
        (success) {
          emit(AuthRegisterSuccess(register: success));
        },
      );
    }
  }
// }
