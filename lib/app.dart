import 'package:flutter/material.dart';
import 'package:report_maker/%20core/theme/theme_data.dart';
import 'package:report_maker/features/report/screen/report_screen.dart';

import ' core/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Report Maker & PDF',
      debugShowCheckedModeBanner: false,
      theme: Theme_Data.lightTheme,
      darkTheme: Theme_Data.darkTheme,
      home: ReportScreen(),
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
