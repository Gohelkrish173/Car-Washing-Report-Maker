import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:report_maker/Data/Models/RD_Model.dart';
import 'package:report_maker/data/providers/rd_repository_provider.dart';

final RDStateNotifierProvider = StateNotifierProvider.autoDispose<RDStateNotifier,RD_Model>(
    (Ref ref) {
      return RDStateNotifier(
        ref,
        RD_Model(Report_Id: 0),
      );
    }
);

class RDStateNotifier extends StateNotifier<RD_Model>{
  final Ref ref;
  RDStateNotifier(this.ref,super.state);

  // ---------------- update Properties --------------------------
  void updateReportId(int report_Id){
    state.copyWith(
      Report_Id: report_Id
    );
  }

  void updateRegNo(String regNo){
    state.copyWith(
      Reg_No: regNo,
    );
  }

  void updateJCNo(int jcNo){
    state.copyWith(
      JC_No: jcNo
    );
  }

  void updateModalName(String modalName){
    state.copyWith(
      ModalName: modalName,
    );
  }

  void updateService(String service){
    state.copyWith(
      Service: service
    );
  }

  void updateWashing(int washing){
    state.copyWith(
      Washing: washing,
    );
  }

  void updateTechnicianName(String name){
    state.copyWith(
      Technician_Name: name,
    );
  }

  void updateRemark(String remark){
    state.copyWith(
      Remark: remark
    );
  }

  // -------------------- Report Detail Insert & Update method ---------------------------

  Future<bool> insertReportDetail() async{
    RD_Model model = new RD_Model(
      Report_Id: state.Report_Id,
      Reg_No:  state.Reg_No,
      JC_No: state.JC_No,
      ModalName: state.ModalName,
      Service: state.Service,
      Washing: state.Washing,
      Technician_Name: state.Technician_Name,
      Remark: state.Remark
    );

    final result = await ref.read(report_detail_Repository_Provider).insertReportDetail(model);

    return result;
  }

  Future<bool> updateReportDetail(int rd_Id) async{
    RD_Model model = new RD_Model(
      Report_Id: state.Report_Id,
      Reg_No: state.Reg_No,
      JC_No: state.JC_No,
      ModalName: state.ModalName,
      Service: state.Service,
      Washing: state.Washing,
      Technician_Name: state.Technician_Name,
      Remark: state.Remark,
      RD_Id: rd_Id
    );

    final result = await ref.read(report_detail_Repository_Provider).updateReportDetail(model, rd_Id);

    return result;
  }

}