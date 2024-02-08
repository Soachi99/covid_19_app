import 'package:covid_19_app/src/features/login/data/login_repository.dart';
import 'package:covid_19_app/src/features/login/domain/services/dialog_service.dart';
import 'package:covid_19_app/src/features/login/domain/services/form_service.dart';
import 'package:covid_19_app/src/features/login/domain/services/user_service.dart';
import 'package:covid_19_app/src/tools/tools.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'login_state.dart';

class LoginController extends StateNotifier<LoginState> {
  final UserService userService;
  final DialogService dialogService;
  final FormService formService;
  final LoginRepository loginRepository;
  final GoRouter goRouter;

  LoginController(
      {required this.userService,
      required this.goRouter,
      required this.dialogService,
      required this.formService,
      required this.loginRepository})
      : super(LoginState());

  initData() async {
    await loginRepository.saveDataInLocal();
  }

  verify(String username, String password) async {
    state = state.copyWith(firstValidation: true);
    if (formService.validateForm()) {
      var (result, message) = await userService.verifyUser(username, password);

      switch (result) {
        case 0:
          goRouter.go(Routes.home);
          break;
        case 1:
          dialogService.showErrorDialog(message);
          break;
        case 2:
          Fluttertoast.showToast(msg: message);
          break;
        default:
      }
    }
  }
}

final loginController =
    StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController(
      userService: ref.watch(userServiceProvider),
      goRouter: ref.watch(goRouterProvider),
      dialogService: ref.watch(dialogServiceProvider),
      formService: ref.watch(formServiceProvider),
      loginRepository: ref.watch(loginRepositoryProvider));
});
