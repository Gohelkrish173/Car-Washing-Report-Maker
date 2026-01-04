
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:report_maker/data/providers/global_provider.dart';
import 'package:report_maker/data/repositories/report_detail_repository.dart';

final report_detail_Repository_Provider = Provider<Report_Detail_Repository>((ref){
  final dbAsync = ref.watch(getDatabaseProvider);

  return dbAsync.when(
    data: (db)=>Report_Detail_Repository(db: db, ref: ref),
    error: (e,_) => throw Exception(e),
    loading: () => throw UnimplementedError('DB is not Ready!'),
  );
});