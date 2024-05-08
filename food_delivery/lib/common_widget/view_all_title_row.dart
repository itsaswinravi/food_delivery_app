import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';

class viewAllTitleRow extends StatelessWidget {
  final String title;
  final VoidCallback onView;
  const viewAllTitleRow({super.key, required this.title, required this.onView});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text (
          title,
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 20,
            fontWeight: FontWeight.w800
          ),),
          TextButton (
            onPressed: onView,
            child: Text(
              "View all",
              style: TextStyle(
                color: TColor.primary,
                fontSize: 13,
                fontWeight: FontWeight.w500),
            ),
          ),
      ],
    );
  }
}