import 'package:flutter/material.dart';
export 'themes.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF5C6BC0);    
  static const Color secondaryColor = Color(0xFF26A69A);  
  static const Color backgroundColor = Color(0xFFF5F5F5); 
  
  // Ajout des couleurs pour le texte
  static const Color textPrimary = Color(0xFF2D3436);    // Presque noir pour le texte principal
  static const Color textSecondary = Colors.white;        // Blanc pour le texte sur fond coloré
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      surface: AppColors.backgroundColor,
    ),
    
    // Configuration de la police
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: const Color.fromARGB(255, 0, 200, 255),
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 14,
      ),
    ),

    // Configuration de l'AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.textSecondary,  // Texte blanc pour l'AppBar
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}