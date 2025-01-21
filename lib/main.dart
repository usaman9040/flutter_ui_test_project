import 'package:ava_finance/utils/constants.dart';
import 'package:ava_finance/utils/theme.dart';
import 'package:ava_finance/views/home_view.dart';
import 'package:ava_finance/views/information_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 840),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          ConstantsHelper.setSharedPreferences();
          return MaterialApp(
            title: 'Flutter Demo',
            theme: CustomTheme.lightTheme,
            home: HomeView(),
          );
        });
  }
}
