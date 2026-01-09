import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:report_maker/Data/Models/RD_Model.dart';
import 'package:report_maker/data/providers/rd_repository_provider.dart';
import 'package:report_maker/data/repositories/report_detail_repository.dart';

final rd_Async_Notifier_Provider = AsyncNotifierProvider.family<RD_Async_Notifier,List<RD_Model>,int>(
    (int report_Id){
      return RD_Async_Notifier(report_Id);
    }
);

class RD_Async_Notifier extends AsyncNotifier<List<RD_Model>>{
  late Report_Detail_Repository _rd;
  late int report_Id;

  @override
  FutureOr<List<RD_Model>> build(int report_Id) async{
    this.report_Id = report_Id;
    _rd = ref.read(report_detail_Repository_Provider);

    return await _rd.getReportDetailList(report_Id);
  }

}
