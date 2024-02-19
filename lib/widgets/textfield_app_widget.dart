import 'package:financial_planner_app/theme/colors.dart';
import 'package:flutter/material.dart';

class TextFieldAppWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String title;

  const TextFieldAppWidget(
      {super.key,
        required this.controller,
        required this.hintText,
        required this.title});

  @override
  State<TextFieldAppWidget> createState() => _TextFieldAppWidgetState();
}

class _TextFieldAppWidgetState extends State<TextFieldAppWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.title,
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 5),
        TextField(
          style: TextStyle(color: Colors.white),
          controller: widget.controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.darkBlue,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: AppColors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}