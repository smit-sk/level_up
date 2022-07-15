import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:levelup/helper/routeHelper.dart';
import 'package:levelup/util/color.dart';
import 'package:levelup/util/decoration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scaffoldMessengerKey: snackbarKey,
      title: 'Level Up',
      theme: ThemeData(
        primaryColor: primary,
      ),
      getPages: RouteHelper.routes,
      initialRoute: RouteHelper.getDashboardRoute(),
    );
  }
}
