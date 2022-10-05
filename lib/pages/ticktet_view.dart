import 'dart:ffi';

import 'package:book_tickets/utils/app_styles.dart';
import 'package:book_tickets/widgets/thick_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:book_tickets/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;
  const TicketView({Key? key, required this.ticket, this.isColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width * 0.85,
      height: AppLayout.getHeight(198),
      child: Container(
        margin: EdgeInsets.only(
            left: AppLayout.getHeight(isColor == null ? 15 : 0)),
        child: Column(
          children: [
            /*
              light brown part of the ticket
            */
            Container(
              decoration: BoxDecoration(
                color: isColor == null
                    ? const Color.fromRGBO(201, 173, 146, 1)
                    : Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppLayout.getHeight(21)),
                    topRight: Radius.circular(AppLayout.getHeight(21))),
              ),
              padding: EdgeInsets.all(AppLayout.getHeight(16)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "${ticket['tittle']}",
                        style: isColor == null
                            ? Styles.headLineStyle3
                                .copyWith(color: Colors.white)
                            : Styles.headLineStyle3
                                .copyWith(color: Colors.black),
                      ),
                      Expanded(child: Container()),
                      const ThickContainer(
                        isColor:
                            true, ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            SizedBox(
                              height: AppLayout.getHeight(24),
                              child: LayoutBuilder(
                                builder: (BuildContext context,
                                    BoxConstraints constraints) {
                                  return Flex(
                                      direction: Axis.horizontal,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          (constraints.constrainWidth() / 6)
                                              .floor(),
                                          (index) => SizedBox(
                                                width: 3,
                                                height: 2,
                                                child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                      color: isColor == null
                                                          ? Colors.white
                                                          : Colors
                                                              .grey.shade400),
                                                ),
                                              )));
                                },
                              ),
                            ),
                            Center(
                              child: Icon(
                                Icons.watch_later,
                                color: isColor == null
                                    ? Colors.white
                                    : Colors.grey.shade400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const ThickContainer(
                        isColor:
                            true, /////////////////////////////////////////////////////////////////////////////////////
                      ),
                      const Spacer(),
                      Text(
                        "Room ${ticket['room']}",
                        style: isColor == null
                            ? Styles.headLineStyle3
                                .copyWith(color: Colors.white)
                            : Styles.headLineStyle3
                                .copyWith(color: Colors.black),
                      )
                    ],
                  ),
                  const Gap(3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text('Movie',
                            style: isColor == null
                                ? Styles.headLineStyle4
                                    .copyWith(color: Colors.white)
                                : Styles.headLineStyle3),
                      ),
                      Text("${ticket['runtime']}",
                          style: isColor == null
                              ? Styles.headLineStyle4
                                  .copyWith(color: Colors.white)
                              : Styles.headLineStyle3
                                  .copyWith(color: Colors.black)),
                      SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text('Theater Room',
                            textAlign: TextAlign.end,
                            style: isColor == null
                                ? Styles.headLineStyle4
                                    .copyWith(color: Colors.white)
                                : Styles.headLineStyle3),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            /*
              dark brown part with cutting part of the ticket
            */
            Container(
              color: isColor == null ? Styles.darkBorwnColor : Colors.white,
              child: Row(children: [
                SizedBox(
                  height: AppLayout.getHeight(20),
                  width: AppLayout.getWidth(10),
                  child: const DecoratedBox(
                    decoration: BoxDecoration(
                        color: Color(0xFFeeedf2),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(
                            (constraints.constrainWidth() / 25).floor(),
                            (index) => SizedBox(
                                  width: 5,
                                  height: 1,
                                  child: DecoratedBox(
                                      decoration: BoxDecoration(
                                    color: isColor == null
                                        ? Color(0xFFeeedf2)
                                        : Colors.grey,
                                  )),
                                )),
                      );
                    },
                  ),
                )),
                SizedBox(
                  height: AppLayout.getHeight(20),
                  width: AppLayout.getWidth(10),
                  child: const DecoratedBox(
                    decoration: BoxDecoration(
                        color: Color(0xFFeeedf2),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                  ),
                ),
              ]),
            ),
            /*
              dark brown part with cutting part of the ticket
            */
            Container(
              decoration: BoxDecoration(
                color: isColor == null
                    ? Color.fromRGBO(161, 120, 82, 1)
                    : Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(isColor == null ? 21 : 0),
                    bottomRight: Radius.circular(isColor == null ? 21 : 0)),
              ),
              padding: const EdgeInsets.only(
                  left: 16, top: 10, right: 16, bottom: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${ticket['date']}",
                            style: isColor == null
                                ? Styles.headLineStyle4
                                    .copyWith(color: Colors.white)
                                : Styles.headLineStyle3
                                    .copyWith(color: Colors.black),
                          ),
                          const Gap(5),
                          Text("Date",
                              style: isColor == null
                                  ? Styles.headLineStyle4
                                      .copyWith(color: Colors.white)
                                  : Styles.headLineStyle3),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${ticket['session_time']}",
                            style: isColor == null
                                ? Styles.headLineStyle3
                                    .copyWith(color: Colors.white)
                                : Styles.headLineStyle3
                                    .copyWith(color: Colors.black),
                          ),
                          const Gap(5),
                          Text("Session Time",
                              style: isColor == null
                                  ? Styles.headLineStyle4
                                      .copyWith(color: Colors.white)
                                  : Styles.headLineStyle3),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "${ticket['seat']}",
                            style: isColor == null
                                ? Styles.headLineStyle4
                                    .copyWith(color: Colors.white)
                                : Styles.headLineStyle3
                                    .copyWith(color: Colors.black),
                          ),
                          const Gap(5),
                          Text("Seat",
                              style: isColor == null
                                  ? Styles.headLineStyle4
                                      .copyWith(color: Colors.white)
                                  : Styles.headLineStyle3),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
