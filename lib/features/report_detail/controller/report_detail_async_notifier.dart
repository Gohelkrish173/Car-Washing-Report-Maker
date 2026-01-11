import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:report_maker/Data/Models/RD_Model.dart';
import 'package:report_maker/data/providers/rd_repository_provider.dart';
import 'package:report_maker/data/repositories/report_detail_repository.dart';

final rd_reportId_Provider = Provider<int>((ref)=>0);

final rd_Async_Notifier_Provider = AsyncNotifierProvider.family<RD_Async_Notifier,List<RD_Model>,int>(
    (int report_Id){
      return RD_Async_Notifier();
    }
);

class RD_Async_Notifier extends AsyncNotifier<List<RD_Model>>{
  late Report_Detail_Repository _rd;
  late int report_Id;

  @override
  Future<List<RD_Model>> build() async{
    report_Id = ref.watch(rd_reportId_Provider);
    _rd = ref.read(report_detail_Repository_Provider);

    return await _rd.getReportDetailList(report_Id);
  }

  // it can run like start loading then get data and then if error ocur then reflect.
  // try{
  //   final current = state.value ?? [];
  //   state = AsyncValue.data(
  //     current.where((d) => d.RD_Id == rd_Id).toList(),
  //   );
  // }
  // catch(e,st){
  //   state = AsyncValue.error(e, st);
  // }

  // update after successfull Insert Operation
  void insert_rd_in_async(RD_Model rd){
    // there state.whenData is preserve error and loading and only update data.
    state.whenData((list){
      state = AsyncData([...list,rd]);
    });
  }

  // update after successfull update Operation
  void update_rd_in_async(RD_Model rd){
    try{
      // there state.whenData is preserve error and loading and only update data.
      state.whenData((list){
        state = AsyncData(
            list.map((d)=>d.RD_Id == rd.RD_Id ? rd : d).toList());
      });
    }
    catch(e,st){
      state = AsyncValue.error(e, st);
    }
  }

  // update after successfull delete Operation
  void delete_rd_in_async(int rd_Id){
    // there state.whenData is preserve error and loading and only update data.
    state.whenData((list){
      state = AsyncData(
        list.where((r)=>r.RD_Id != rd_Id).toList(),
      );
    });
  }

}
