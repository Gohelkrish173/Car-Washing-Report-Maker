import 'package:flutter/material.dart';
import 'package:report_maker/features/report/screen/report_screen.dart';
import 'package:report_maker/features/report_detail/screen/rd_screen.dart';

class AppRoutes{
  static const String initialRoute = "/allReport";

  static const String allReport = "/allReport";
  static const String reportDetailPage = "/reportDetail";

}

class AppRouter{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name){
      case AppRoutes.allReport:
        return MaterialPageRoute(builder: (_)=>const ReportScreen());

      case AppRoutes.reportDetailPage:
        final args = settings.arguments as Map<String,dynamic>;

        return MaterialPageRoute(
            builder: (_)=>RD_Screen(
              report_Id: args['report_Id'],
            ),
        );

      default :
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text("404 - Page Not Found."),),
          ),
        );
    }
  }
}