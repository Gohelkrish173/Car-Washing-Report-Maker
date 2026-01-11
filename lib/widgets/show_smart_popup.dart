import 'dart:async';
import 'package:flutter/material.dart';

Future<void> showSmartPopUp({
  required BuildContext context,
  required String? message,
  required DialogType type,
  String? nextPage, // Required only for success
  Map<String,dynamic>? args, // Required only for success
  bool page_replace = false,// Required only for success
  bool clearNaviStack = true// Required only for success
}) {
  Color accentColor;
  IconData icon;
  bool autoNavigate = false;
  String title;

  switch (type) {
    case DialogType.success:
      title = "Success!";
      accentColor = Colors.greenAccent;
      icon = Icons.check_circle_rounded;
      autoNavigate = true;
      break;
    case DialogType.error:
      title = "Error!";
      accentColor = Colors.redAccent;
      icon = Icons.error_rounded;
      autoNavigate = false;  // ❌ No navigation
      break;
    case DialogType.warning:
      title = "Warning";
      accentColor = Colors.orangeAccent;
      icon = Icons.warning_rounded;
      autoNavigate = false;
      break;
    default:
      title = "Info!";
      accentColor = Colors.blueAccent;
      icon = Icons.info_rounded;
      autoNavigate = false;
  }

  // If success → auto close + navigate after 5 seconds
  if (autoNavigate && nextPage != null) {
    Timer(const Duration(seconds: 5), () {
      Navigator.pop(context);
      if(clearNaviStack == false){
        Navigator.pushNamedAndRemoveUntil(context,
            nextPage,
            // it is use for remove all previous Navi Stack Util when put false
                (route) => false
        );
      }
      if(page_replace){
        Navigator.pushReplacementNamed(
            context,
            nextPage,
            arguments: args
        );
      }
      else{
        Navigator.pushNamed(
            context,
            nextPage,
            arguments: args
        );
      }

    });
  }

  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return Dialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        insetPadding: const EdgeInsets.all(25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 30,
                spreadRadius: 5,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 60, color: accentColor),
              const SizedBox(height: 15),
              Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: accentColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                message ?? "Connection Network Error",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 20),

              // ONLY show button if NOT auto navigate
              if (!autoNavigate)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentColor,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text("Try Again!"),
                  ),
                ),
            ],
          ),
        ),
      );
    },
  );
}

enum DialogType { success, error, warning, info }