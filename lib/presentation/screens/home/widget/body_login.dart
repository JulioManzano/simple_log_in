import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_sign_in/presentation/bloc/service_locator.dart';
import 'package:simple_sign_in/presentation/widget/component/loading.dart';

import '../../../../core/constants/icon_assets.dart';
import '../../../../core/utils/const.dart';
import '../../../../styles/style.dart';
import '../../../bloc/progress/auth/auth_bloc.dart';
import '../../../widget/component/common_button.dart';

class BodyLogin extends StatelessWidget {
  const BodyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = context.watch<AuthBloc>();

    if (authBloc.state.loading) return const Loading();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 2),
        Text(
          "¡Hola!",
          style: Style.titleB(),
        ),
        Text(
          "Bienvenido",
          style: Style.titleB(),
        ),
        const Spacer(),
        CommonButton(
          text: "INICIAR CON GOOGLE ",
          onTap: () => initWithGoogle(context),
          backgroundColor: kPrimaryColor,
          borderColor: Colors.white,
          textColor: Colors.white,
          expanded: false,
          shadow: true,
          fontSize: 18,
          icon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SvgPicture.asset(
              kIconGoogle,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        const Spacer(flex: 2),
      ],
    );
  }

  initWithGoogle(BuildContext context) async {
    getIt<AuthBloc>().loginWithGoogle(context);
  }
}
