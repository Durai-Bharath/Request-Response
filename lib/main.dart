
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shijin_ui/UI/home.dart';

void main() {
 
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = TextTheme(
      displayLarge: GoogleFonts.lato(
          fontSize: 97, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      displayMedium: GoogleFonts.lato(
          fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      displaySmall: GoogleFonts.lato(fontSize: 48, fontWeight: FontWeight.w400),
      headlineMedium: GoogleFonts.lato(
          fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headlineSmall:
          GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.w400),
      headlineLarge: GoogleFonts.lato(
          fontSize: 24, fontWeight: FontWeight.w400, color: Colors.white),
      titleLarge: GoogleFonts.lato(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: Colors.white),
      titleMedium: GoogleFonts.lato(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      titleSmall: GoogleFonts.lato(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyLarge: GoogleFonts.lato(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyMedium: GoogleFonts.lato(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: Colors.white),
      labelLarge: GoogleFonts.lato(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      bodySmall: GoogleFonts.lato(
          fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      labelSmall: GoogleFonts.lato(
          fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    );
   
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,MediaQuery.of(context).size.height),
      
  minTextAdapt: false,
  builder: (context, child) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: textTheme,
          primarySwatch: Colors.teal,
          colorScheme: ColorScheme.fromSwatch(

              primarySwatch: Colors.teal),
          useMaterial3: true,
        ),
        home:  Home());
  },
    );
  }

 
}
