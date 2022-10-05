import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ThickContainer extends StatelessWidget {
  final bool? isColor;
  const ThickContainer({super.key, required this.isColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              width: 2.5,
              color: isColor == null ? Colors.white : Colors.grey.shade400)),
    );
  }
}
