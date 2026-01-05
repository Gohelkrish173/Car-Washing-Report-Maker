import 'package:flutter/material.dart';
import 'package:report_maker/features/report/screen/report_screen.dart';

class AppRoutes{
  static const String initialRoute = "/allReport";

  static const String allReport = "/allReport";

}

class AppRouter{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name){
      case AppRoutes.allReport:
        return MaterialPageRoute(builder: (_)=>const ReportScreen());

      default :
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text("404 - Page Not Found."),),
          ),
        );
    }
  }
}