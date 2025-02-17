import 'package:flutter/material.dart';
export 'themes.dart';

class AppColors {
  // Couleurs 42
  static const Color primaryColor = Color(0xFF00BABC);    // Turquoise 42
  static const Color secondaryColor = Color(0xFF3E3E3E);  // Gris foncé 42
  static const Color accentColor = Color(0xFFFD2F56);     // Rouge 42
  
  // Couleurs de fond
  static const Color backgroundColor = Color(0xFFF9F9F9);  // Fond très clair
  static const Color surfaceColor = Colors.white;         // Surface blanche
  static const Color codeBlockColor = Color(0xFFF3F3F3);  // Fond pour blocs de code
  
  // Couleurs de texte
  static const Color textPrimary = Color.fromARGB(255, 255, 255, 255);     // Texte principal presque noir
  static const Color textSecondary = Color(0xFF666666);   // Texte secondaire gris
  static const Color textCode = Color(0xFF00BABC);        // Texte pour code
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    
    // Schéma de couleurs
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      surface: AppColors.surfaceColor,
      error: AppColors.accentColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColors.textPrimary,
    ),

    // Configuration des textes
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        fontFamily: 'RobotoMono',
      ),
      displayMedium: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        fontFamily: 'RobotoMono',
      ),
      bodyLarge: TextStyle(
        color: const Color.fromARGB(255, 0, 0, 0),
        fontSize: 16,
        letterSpacing: 0.15,
        fontFamily: 'RobotoMono',
      ),
      bodyMedium: TextStyle(
        color: AppColors.textSecondary,
        fontSize: 14,
        letterSpacing: 0.25,
        fontFamily: 'RobotoMono',
      ),
      labelLarge: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'RobotoMono',
      ),
    ),

    // Configuration de l'AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: 'RobotoMono',
        letterSpacing: 0.15,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),

    // Configuration des cartes
    cardTheme: CardTheme(
      color: AppColors.surfaceColor,
      elevation: 2,
      shadowColor: AppColors.primaryColor.withAlpha(26), // 0.1 * 255 ≈ 26
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: AppColors.primaryColor.withAlpha(26),
          width: 1,
        ),
      ),
    ),

    // Configuration des boutons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        textStyle: TextStyle(
          fontFamily: 'RobotoMono',
          fontWeight: FontWeight.w500,
        ),
      ),
    ),

    // Configuration des champs de texte
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.codeBlockColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
      ),
      labelStyle: TextStyle(
        color: AppColors.textSecondary,
        fontFamily: 'RobotoMono',
      ),
      hintStyle: TextStyle(
        color: AppColors.textSecondary.withAlpha(179), // 0.7 * 255 ≈ 179
        fontFamily: 'RobotoMono',
      ),
    ),

    // Configuration des Tabs
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.primaryColor,
      unselectedLabelColor: AppColors.textSecondary,
      indicatorColor: AppColors.primaryColor,
      labelStyle: TextStyle(
        fontFamily: 'RobotoMono',
        fontWeight: FontWeight.w500,
      ),
    ),

    // Configuration des Dividers
    dividerTheme: DividerThemeData(
      color: AppColors.secondaryColor.withAlpha(26), // 0.1 * 255 ≈ 26
      thickness: 1,
      space: 24,
    ),

    // Configuration des icônes
    iconTheme: IconThemeData(
      color: AppColors.secondaryColor,
      size: 24,
    ),
  );
}