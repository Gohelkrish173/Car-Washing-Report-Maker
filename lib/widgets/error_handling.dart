
import 'package:flutter/material.dart';

class ErrorHandling extends StatelessWidget {
  final String error;
  final VoidCallback? onTap;

  const ErrorHandling({super.key,required this.error,required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.08,vertical: height * 0.08),
          width: width * 1,
          height: height * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                error,
                style: theme.textTheme.headlineMedium?.copyWith(color: Colors.red),
              ),
              ElevatedButton(
                onPressed: onTap,
                child: Row(
                  children: [
                    Icon(Icons.refresh,color: Colors.white,),
                    Text(
                      "Retry",
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
