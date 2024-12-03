import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phibase_next_level/config/api.dart';

import 'routes/routes.dart';

void main() async {
  Api.setupInterceptors();
  runApp(const Fluthi());
}

class Fluthi extends StatelessWidget {
  const Fluthi({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: const ColorScheme.light().copyWith(primary: Colors.blue),
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.login,
      getPages: AppRoutes.pages
    );
  }
}
