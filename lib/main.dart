import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'pages/membres/membre_controller.dart';
import 'pages/splash.dart';

void main() async {
  //
  MembreController membreController = Get.put(MembreController());
  //
  await GetStorage.init();
  runApp(const Anges());
}

class Anges extends StatelessWidget {
  const Anges({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Presence des Anges',
      theme: ThemeData(//deepPurple
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: Splash(),
    );
  }
}

