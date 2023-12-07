
import 'package:autoplusRyan/ryan/home_menu.dart';
import 'package:autoplusRyan/ryan/utils/constants/text_strings.dart';
import 'package:autoplusRyan/ryan/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'bindings/general_bindings.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      home: const HomeMenu(),
    );
  }
}