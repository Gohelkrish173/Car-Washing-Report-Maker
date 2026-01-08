
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:report_maker/Data/Models/ReportModel.dart';
import 'package:report_maker/data/providers/report_repository_provider.dart';

class ReportAsyncNotifier extends AsyncNotifier<List<ReportModel>>{

  @override
  FutureOr<List<ReportModel>> build() async{
    return ref.read(reportRepositoryProvider).getAllReports();
  }

}