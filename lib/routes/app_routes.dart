import 'package:flutter/material.dart';
import '../presentation/farm_monitoring_dashboard_screen/farm_monitoring_dashboard_screen.dart';
import '../presentation/agri_tech_weather_dashboard_screen/agri_tech_weather_dashboard_screen.dart';

import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String farmMonitoringDashboardScreen =
      '/farm_monitoring_dashboard_screen';
  static const String agriTechWeatherDashboardScreen =
      '/agri_tech_weather_dashboard_screen';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        farmMonitoringDashboardScreen: (context) =>
            FarmMonitoringDashboardScreen(),
        agriTechWeatherDashboardScreen: (context) =>
            AgriTechWeatherDashboardScreen(),
        appNavigationScreen: (context) => AppNavigationScreen(),
        initialRoute: (context) => AppNavigationScreen()
      };
}
