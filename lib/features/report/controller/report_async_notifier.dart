import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:report_maker/Data/Models/ReportModel.dart';
import 'package:report_maker/Data/repositories/report_repository.dart';
import 'package:report_maker/data/providers/report_repository_provider.dart';

final reportAsyncNotifierProvider = AsyncNotifierProvider<ReportAsyncNotifier,List<ReportModel>>(
    (){
      return ReportAsyncNotifier();
    }
);

class ReportAsyncNotifier extends AsyncNotifier<List<ReportModel>>{
  late Report_Repository _repo;

  @override
  FutureOr<List<ReportModel>> build() async{
    return refresh_List();
  }

  Future<List<ReportModel>> refresh_List() async {
    _repo = ref.read(reportRepositoryProvider);

    return await _repo.getAllReports();
  }


  // update State after successfull Insert (called after successfull insert)
  void insert_report_in_async(ReportModel report){
    state.whenData((list){
      state = AsyncData([...list,report]);
    });
  }

  // update State after successfull update
  void update_report_in_async(ReportModel report){
    state.whenData((list){
      final updatedList = list
          .map((r)=>r.Report_Id == report.Report_Id ? report : r).toList();

      state = AsyncData(updatedList);
    });
  }

  // update state after successful delete
  void delete_report_in_async(int report_Id){
    state.whenData((list){
      state = AsyncData(
        list.where((r)=>r.Report_Id != report_Id).toList(),
      );
    });
  }

}