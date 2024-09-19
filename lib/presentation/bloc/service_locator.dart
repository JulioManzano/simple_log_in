import 'package:get_it/get_it.dart';
import 'package:simple_sign_in/data/service/auth_service.dart';
import 'package:simple_sign_in/presentation/bloc/progress/auth/auth_bloc.dart';

GetIt getIt = GetIt.instance;

void serviceLocator() {
  getIt.registerSingleton(AuthBloc(AuthService()));
}
