import 'package:flutter/material.dart';

import '../../../widget/component/basic_appbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BasicAppBar(
        centerTitle: true,
        leading: false,
      ),
      body: SingleChildScrollView(),
    );
  }


}
