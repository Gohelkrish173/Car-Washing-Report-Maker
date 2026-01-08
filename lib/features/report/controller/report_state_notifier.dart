import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:report_maker/Data/Models/ReportModel.dart';
import 'package:report_maker/data/providers/report_repository_provider.dart';

final reportStateNotifierProvider = StateNotifierProvider.autoDispose<ReportStateNotifier,ReportModel>(
    (Ref ref){
      return ReportStateNotifier(
          ref,
          ReportModel(Report_Name: "")
      );
    }
);

class ReportStateNotifier extends StateNotifier<ReportModel>{
  final Ref ref;
  ReportStateNotifier(this.ref,super.state);

  // ------- Update Properties --------------------------
  void updateReportName(String name){
    state = state.copyWith(
      Report_Name: name,
    );
  }

  // ---------------------- report Add or Update ---------------------------
  Future<bool> insertReport() async{
    ReportModel model = new ReportModel(Report_Name: state.Report_Name);

    final result = ref.read(reportRepositoryProvider).insert_Report(model);

    return result;
  }

  Future<bool> updateReport(int report_Id) async{
    ReportModel model = new ReportModel(Report_Name: state.Report_Name);

    final result = ref.read(reportRepositoryProvider).update_Report(model, report_Id);

    return result;
  }

}