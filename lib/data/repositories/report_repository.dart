import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:report_maker/Data/Models/ReportModel.dart';
import 'package:report_maker/Data/providers/global_provider.dart';
import 'package:sqflite/sqflite.dart';

class Report_Repository{
  final Database db;
  final Ref ref;

  Report_Repository({
    required this.db,
    required this.ref
  });

  Future<List<ReportModel>> getAllReports() async {
    try{
      final result = await db.query('select_reports');

      if(result.length < 0){
        throw Exception('List Not Found');
      }

      return ReportModel.listReportModels(result);
    }
    catch(e){
      ref.read(responseStateProvider.notifier).state = "List Not Found. & ${e}";
      return [];
    }
  }

}