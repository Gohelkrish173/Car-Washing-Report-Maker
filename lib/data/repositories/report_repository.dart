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
      ref.read(responseStateProvider.notifier).state = "Report List Not Found. & ${e}";
      return [];
    }
  }

  Future<ReportModel> getReportById(int report_Id) async{
    try{
      final result = await db.query('Report',
          columns: ['Report_Id','Report_Name','IsActive','Created_Date','Modified_Date'],
          where: 'Report_Id = ?',
          whereArgs: [report_Id],
          limit: 1
      );

      if(result.isEmpty){
        throw Exception('Report Not Found');
      }

      return ReportModel.fromMap(result.first);
    }
    catch(e){
      ref.read(responseStateProvider.notifier).state = "Report Not Found.";
      return ReportModel(Report_Name: "", IsActive: 1);
    }
  }

  Future<bool> insert_Report(ReportModel model) async{
    try{
      model.IsActive = 1;
      model.Created_Date = DateTime.now().toIso8601String().split('T').first;

      final result = await db.insert('Report',model.toMap());

      if(result < 0){
        throw Exception("Report Insertion Failed.");
      }

      ref.read(responseStateProvider.notifier).state = "Report Insertion Successfully.";

      return true;
    }
    catch(e){
      ref.read(responseStateProvider.notifier).state = "Report Insertion Failed. ${e}";

      return false;
    }
  }

  Future<bool> update_Report(ReportModel model,int report_Id) async{
    try{
      final result1 = await getReportById(report_Id);

      model.Report_Id = model.Report_Id ?? result1.Report_Id;
      model.Report_Name = model.Report_Name ?? result1.Report_Name;
      model.IsActive = 1;
      model.Created_Date = model.Created_Date ?? result1.Created_Date;
      model.Modifier_Date = DateTime.now().toIso8601String().split('T').first;

      final result = await db.update('Report',model.toMap(),where: 'Report_Id = ?',whereArgs: [report_Id]);

      if(result < 0){
        throw Exception("Report Updation Failed.");
      }

      ref.read(responseStateProvider.notifier).state = "Report Updation Successfully.";

      return true;
    }
    catch(e){
      ref.read(responseStateProvider.notifier).state = "Report Updation Failed. ${e}";

      return false;
    }
  }

  Future<bool> delete_Report(int report_Id) async{
    try{
      String date = DateTime.now().toIso8601String().split('T').first;

      final result = await db.rawUpdate(
        'Update Report set IsActive = 0,Modified_Date = ${date} where Report_Id = ?',
        [report_Id],
      );

      if(result < 0){
        throw Exception("Report Deletion Failed.");
      }

      ref.read(responseStateProvider.notifier).state = "Report Deletion Successfully.";

      return true;
    }
    catch(e){
      ref.read(responseStateProvider.notifier).state = "Report Deletion Failed. ${e}";

      return false;
    }
  }
}