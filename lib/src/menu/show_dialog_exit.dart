import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 

class ShowDialogExit extends StatelessWidget {
  const ShowDialogExit({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return AlertDialog(
      backgroundColor: isDarkMode ? Colors.grey[850] : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      title: const Text(
        'EXIT',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: const Text(
        'Exit from application?',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Batal',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {
            Navigator.pop(context);
            if (Platform.isAndroid) {
              SystemNavigator.pop();
            } else {
              exit(0);
            }
          },
          child: const Text(
            'Oke',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
