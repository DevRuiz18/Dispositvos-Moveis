import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppLayoutBuilder extends StatelessWidget {
  final bool? isColor;
  final int sections;
  const AppLayoutBuilder({super.key, this.isColor, required this.sections});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: List.generate(
              (constraints.constrainWidth() / sections).floor(),
              (index) => SizedBox(
                    width: 5,
                    height: 1,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                      color: isColor == null ? Color(0xFFeeedf2) : Colors.grey,
                    )),
                  )),
        );
      },
    );
  }
}
