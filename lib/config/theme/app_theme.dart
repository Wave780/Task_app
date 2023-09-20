import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';


@immutable
class AppTheme {
  // private constructor
  const AppTheme._();

  static final light = FlexThemeData.light(
      scheme: FlexScheme.indigo,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
      blendLevel: 40,
      appBarStyle: FlexAppBarStyle.primary,
      appBarOpacity: 0.35,
      appBarElevation: 0,
      transparentStatusBar: true,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      swapColors: true,
      lightIsWhite: true,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      //fontFamily: GoogleFonts.damion().fontFamily,
      subThemesData: const FlexSubThemesData(
        useTextTheme: true,
        fabUseShape: true,
        interactionEffects: true,
        bottomNavigationBarElevation: 0,
        bottomNavigationBarOpacity: 1,
        navigationBarOpacity: 1,
        navigationBarMutedUnselectedIcon: true,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        inputDecoratorUnfocusedHasBorder: true,
        blendOnColors: true,
        blendTextTheme: true,
        popupMenuOpacity: 0.95,
      ));
}
