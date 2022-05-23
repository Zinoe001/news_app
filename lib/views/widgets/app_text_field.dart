import 'package:flutter/material.dart';
import 'package:news_app/utils/color.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kAccentColor.shade700),
      child: TextFormField(
        decoration: const InputDecoration(
          // prefixIcon: Icon(Icons.search),
          hintText: "Search",
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          border: InputBorder.none
        ),
      ),
    );
  }
}
