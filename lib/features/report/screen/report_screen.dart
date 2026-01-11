
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:report_maker/Data/Models/ReportModel.dart';
import 'package:report_maker/features/report/controller/report_async_notifier.dart';
import 'package:report_maker/features/report/widget/report_card.dart';
import 'package:report_maker/widgets/error_handling.dart';
import 'package:report_maker/widgets/indicator.dart';

class ReportScreen extends ConsumerWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final reports = ref.watch(reportAsyncNotifierProvider);
    
    return reports.when(
      data: (data) => ReportsDisplayScreen(reports: data),
      error: (e,_) => ErrorHandling(
        error: e.toString(),
        onTap: () async{
          ref.read(reportAsyncNotifierProvider.notifier).refresh_List();
        }
      ),
      loading: () => Indicator(),
    );
  }
}

class ReportsDisplayScreen extends StatelessWidget {
  final List<ReportModel> reports;
  const ReportsDisplayScreen({required this.reports,super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Report List",style: theme.textTheme.bodyLarge,),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.015,
            horizontal: width * 0.040,
          ),
          child: ListView.separated(
            separatorBuilder: (_,__) => SizedBox(height: 0,),
            itemCount: reports.length,
            itemBuilder: (context,index){
              return InkWell(
                onTap: (()=>{
                  Map<String,dynamic> r = new Map();
                  Navigator.pushNamed(context, '/reportDetail',arguments: []),
                }),
                child: ReportCard(
                  report_Name: reports[index].Report_Name,
                  report_date: reports[index].Created_Date,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

