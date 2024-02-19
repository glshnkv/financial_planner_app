import 'package:financial_planner_app/theme/colors.dart';
import 'package:flutter/material.dart';

class ActionButtonWidget extends StatelessWidget {
  final String text;
  final double width;
  final void Function()? onTap;

  const ActionButtonWidget(
      {super.key,
        required this.text,
        required this.width,
        required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        width: width,
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.blue,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
