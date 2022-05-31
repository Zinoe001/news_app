import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:news_app/utils/text.dart';

class NewsFlushbar {
  showError(BuildContext context,{required String title,required String message}) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 3),
      titleText: AppText.heading3(text: title,color: Colors.white,),
      messageText: AppText.caption(text: message,color: Colors.white,),
    ).show(context);
  }

  showSuccessful(BuildContext context,{required String title,required String message}) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 3),
      titleText: AppText.heading3(text: title,color: Colors.white,),
      messageText: AppText.caption(text: message,color: Colors.white,),
    ).show(context);
  }
}
