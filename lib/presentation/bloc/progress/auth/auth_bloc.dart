import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_sign_in/presentation/screens/home/home_screen.dart';

import '../../../../core/utils/helper_dialog.dart';
import '../../../../data/service/auth_service.dart';

class AuthState {
  bool loading;

  AuthState({required this.loading});
}

class AuthBloc extends Cubit<AuthState> {
  final AuthService _authService = AuthService();

  AuthBloc() : super(AuthState(loading: false));

  User? get currentUser => _authService.currentUser;
  Future signOut() async {
    _authService.signOut();
  }
  Future loginWithGoogle(BuildContext context) async {
    emit(AuthState(loading: true));

    final res = await _authService.signInWithGoogle();
    if (!context.mounted) return;

    emit(AuthState(loading: false));

    if (res != null) {
      if (res.isSuccess) {
        context.go(HomeScreen.route);
      } else {
        HelperDialog.customDialogBasic(
          context,
          title: "Fallo al iniciar con google",
        );
      }
    }
  }
}
