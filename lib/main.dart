import 'package:flutter/material.dart';
import 'package:simple_sign_in/core/utils/helper_route.dart';
import 'package:simple_sign_in/presentation/bloc/service_locator.dart';
import 'package:simple_sign_in/styles/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Simple Login',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(),
      routerConfig: router,
    );
  }
}
