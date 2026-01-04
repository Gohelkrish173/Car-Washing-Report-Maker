
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:report_maker/Data/repositories/report_repository.dart';
import 'package:report_maker/data/providers/global_provider.dart';

final reportRepositoryProvider = Provider<Report_Repository>((ref){
  final dbAsync = ref.watch(getDatabaseProvider);

  return dbAsync.when(
    data: (db) => Report_Repository(db: db, ref: ref),
    error: (e,_)=>throw Exception(e),
    loading: () => throw UnimplementedError('DB not ready!'),
  );
});