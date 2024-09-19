import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_sign_in/core/utils/const.dart';
import 'package:simple_sign_in/data/service/auth_service.dart';
import 'package:simple_sign_in/presentation/widget/component/common_button.dart';
import 'package:simple_sign_in/styles/style.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String route = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Spacer(flex: 2),
            Text(
              "HOME",
              style: Style.titleB(),
            ),
            if (kDebugMode) ...[
              const Spacer(),
              CommonButton(
                text: " LOGOUT ",
                onTap: () => logout(context),
                backgroundColor: kPrimaryColor,
                textColor: Colors.white,
                expanded: false,
                icon: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.logout, color: Colors.white),
                ),
                borderColor: Colors.white,
              ),
            ],
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }

  //Code logout testing
  logout(BuildContext context) async {
    await AuthService().signOut();
    if (!context.mounted) return;
    context.go("/");
  }
}
