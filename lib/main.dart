import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/home_screen.dart';

void main() {
  runApp(const OtticTodoApp());
}

class OtticTodoApp extends StatelessWidget {
  const OtticTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'to do app',
      debugShowCheckedModeBanner: false, // Removes the DEBUG banner
      theme: ThemeData(
        primaryColor: const Color(0xFFA8E6CF), // Sugarcane green
        scaffoldBackgroundColor: const Color(0xFFFFFFFF), // White
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFA8E6CF),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}