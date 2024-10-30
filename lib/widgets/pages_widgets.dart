import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infoz/pages/cpu_page.dart';
import 'package:infoz/pages/env_page.dart';
import 'package:infoz/pages/splash_page.dart';

List<GetPage<dynamic>> get Pages {
  return [
    GetPage(
      name: "/",
      page: () => const SplashPage(),
      curve: Curves.easeInCirc,
    ),
    GetPage(
      name: "/home",
      page: () => const SplashPage(),
      curve: Curves.easeInOutCubicEmphasized,
    ),
    GetPage(
      name: "/env",
      page: () => const EnvPage(),
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(
      name: "/cpu",
      page: () => const CpuPage(),
      curve: Curves.bounceIn,
    ),
  ];
}


