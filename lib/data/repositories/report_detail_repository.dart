import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:report_maker/Data/Models/RD_Model.dart';
import 'package:sqflite/sqflite.dart';

import '../providers/global_provider.dart';

class Report_Detail_Repository{
  final Database db;
  final Ref ref;

  Report_Detail_Repository({
    required this.db,
    required this.ref
  });

  Future<List<RD_Model>> getReportDetailList(int report_Id) async {
    try{
      final result = await db.query('Report_Detail',
        columns: ['RD_Id','Report_Id','Reg_No','JC_No','ModalName','Service','Washing','Technician_Name','Remark','Created_Date','Modified_Date'],
        where: 'Report_Id = ?',
        whereArgs: [report_Id],
        orderBy: 'Report_Id DESC'
      );

      if(result.length < 0){
        throw Exception('List Not Found');
      }

      return RD_Model.listRDModels(result);
    }
    catch(e){
      ref.read(responseStateProvider.notifier).state = "Details List Not Found. & ${e}";
      return [];
    }
  }

  Future<RD_Model> getReportDetail(int rd_Id) async{
    try{
      final result = await db.query('Report_Detail',
        columns: ['RD_Id','Report_Id','Reg_No','JC_No','ModalName','Service','Washing','Technician_Name','Remark','Created_Date','Modified_Date'],
        where: 'RD_Id = ?',
        whereArgs: [rd_Id],
        limit: 1
      );

      if(result.isEmpty){
        throw Exception('Detail Not Found');
      }

      return RD_Model.fromMap(result.first);
    }
    catch(e){
      ref.read(responseStateProvider.notifier).state = "Detail Not Found.";
      return RD_Model(Report_Id: 0);
    }
  }

  Future<bool> insertReportDetail(RD_Model model) async{
    try{
      model.Created_Date = DateTime.now().toIso8601String().split('T').first;

      final result = await db.insert('Report', model.toMap());

      if(result < 0){
        throw Exception("Insertion Failed.");
      }

      ref.read(responseStateProvider.notifier).state = "Report Detail Insertion Successfully.";

      return true;
    }
    catch(e){
      ref.read(responseStateProvider.notifier).state = "Report Detail Insertion Failed.";

      return false;
    }
  }

  Future<bool> updateReportDetail(RD_Model model,int rd_Id) async{
    try{
      final result1 = await getReportDetail(rd_Id);

      model.RD_Id = model.RD_Id ?? result1.RD_Id;
      model.Report_Id = model.Report_Id ?? result1.Report_Id;
      model.Reg_No = model.Reg_No ?? result1.Reg_No;
      model.JC_No = model.JC_No ?? result1.JC_No;
      model.ModalName = model.ModalName ?? result1.ModalName;
      model.Service = model.Service ?? result1.Service;
      model.Washing = model.Washing ?? result1.Washing;
      model.Technician_Name = model.Technician_Name ?? result1.Technician_Name;
      model.Remark = model.Remark ?? result1.Remark;
      model.Created_Date = model.Created_Date ?? result1.Created_Date;
      model.Modified_Date = DateTime.now().toIso8601String().split('T').first;
      final result = await db.update('Report', model.toMap(),where: 'RD_Id = ?',whereArgs: [rd_Id]);

      if(result < 0){
        throw Exception("Report Detail Updation Failed.");
      }

      ref.read(responseStateProvider.notifier).state = "Report Detail Updation Successfully.";

      return true;
    }
    catch(e){
      ref.read(responseStateProvider.notifier).state = "Report Detail Updation Failed. ${e}";

      return false;
    }
  }

  Future<bool> deleteReportDetail(int rd_Id) async{
    try{
      final result = await db.delete('Report_Detail',where: 'RD_ID = ?',whereArgs: [rd_Id]);

      if(result < 0){
        throw Exception("Report Detail Deletion Failed");
      }

      ref.read(responseStateProvider.notifier).state = "Report Detail Deletion Successfully.";

      return true;
    }
    catch(e){
      ref.read(responseStateProvider.notifier).state = "Report Detail Deletion Failed. ${e}";
      return false;
    }
  }
}