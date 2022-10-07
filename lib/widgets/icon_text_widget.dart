import 'package:book_tickets/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../utils/app_styles.dart';
import 'package:gap/gap.dart';

class AppIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  const AppIconText({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: AppLayout.getWidth(10),
          horizontal: AppLayout.getHeight(10)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppLayout.getWidth(10))),
      child: Row(
        children: [
          Icon(
            icon,
            color: Color.fromRGBO(201, 173, 146, 1),
          ),
          Gap(AppLayout.getWidth(10)),
          Text(
            text,
            style: Styles.headLineStyle4,
          )
        ],
      ),
    );
  }
}
