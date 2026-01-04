import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:report_maker/Data/Models/RD_Model.dart';
import 'package:sqflite/sqflite.dart';

class Report_Detail_Repository{
  final Database db;
  final Ref ref;

  Report_Detail_Repository({
    required this.db,
    required this.ref
  });

  Future<List<RD_Model>> getReportDetail(int Report_Id) async {
    try{
      final result = await db.query('Report_Detail',columns: ['RD_Id','Report_Id',]);

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