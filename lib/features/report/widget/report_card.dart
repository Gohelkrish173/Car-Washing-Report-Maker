
import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  final String report_Name;
  final String? report_date;
  const ReportCard({required this.report_Name,this.report_date,super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded( // ✅ width only
              child: Column(
                mainAxisSize: MainAxisSize.min, // 🔥 critical
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    report_Name,
                    style: theme.textTheme.bodyLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    report_date.toString(),
                    style: theme.textTheme.bodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
