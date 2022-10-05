import 'package:book_tickets/utils/app_layout.dart';
import 'package:book_tickets/widgets/icon_text_widget.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../utils/app_styles.dart';
import 'package:gap/gap.dart';

import '../widgets/double_text_widget.dart';
import '../widgets/ticket_tabs.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: AppLayout.getWidth(20),
            vertical: AppLayout.getHeight(20)),
        children: [
          Gap(AppLayout.getHeight(40)),
          Text(
            "What are\nyou loooking for?",
            style: Styles.headLineStyle1
                .copyWith(fontSize: AppLayout.getWidth(35)),
          ),
          Gap(AppLayout.getHeight(20)),
          const AppTicketTabs(
              firstTab: 'Movie Tickets', secondTab: 'New Movies'),
          Gap(AppLayout.getHeight(25)),
          const AppIconText(
            icon: FluentSystemIcons.ic_fluent_ticket_regular,
            text: "Yet To Watch",
          ),
          Gap(AppLayout.getHeight(20)),
          const AppIconText(
            icon: FluentSystemIcons.ic_fluent_ticket_filled,
            text: "Alaready Used",
          ),
          Gap(AppLayout.getHeight(25)),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: AppLayout.getWidth(15),
                horizontal: AppLayout.getHeight(15)),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(186, 153, 124, 1),
                borderRadius: BorderRadius.circular(AppLayout.getWidth(10))),
            child: Center(
              child: Text(
                "Find Tickets",
                style: Styles.textStyle
                    .copyWith(color: Colors.white, fontSize: 17),
              ),
            ),
          ),
          Gap(AppLayout.getHeight(40)),
          const AppDoubleTextWidget(
              bigText: 'Recomendations', smallText: 'View All'),
          Gap(AppLayout.getHeight(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: AppLayout.getHeight(400),
                width: size.width * 0.42,
                padding: EdgeInsets.symmetric(
                    horizontal: AppLayout.getHeight(15),
                    vertical: AppLayout.getWidth(15)),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(201, 173, 146, 1),
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 1,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      height: AppLayout.getHeight(270),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppLayout.getHeight(15)),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                "assets/images/classic_movie_recomendation.png"),
                          )),
                    ),
                    Gap(AppLayout.getHeight(5)),
                    Text(
                      "The Godfather",
                      style: Styles.textStyle
                          .copyWith(color: Colors.white, fontSize: 20),
                    ),
                    Gap(AppLayout.getHeight(5)),
                    Text(
                      "The classic of an generation. Old but gold.",
                      style: Styles.textStyle.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    width: size.width * 0.44,
                    height: AppLayout.getHeight(174),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(186, 153, 124, 1),
                        borderRadius:
                            BorderRadius.circular(AppLayout.getHeight(18))),
                    padding: EdgeInsets.symmetric(
                        vertical: AppLayout.getWidth(15),
                        horizontal: AppLayout.getHeight(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Discount in these movie theaters if you show the app.",
                          style: Styles.textStyle.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Gap(AppLayout.getHeight(10)),
                        Text(
                          "And remeber to avaliate us on your App Store.",
                          style: Styles.textStyle
                              .copyWith(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Gap(AppLayout.getHeight(15)),
                  Container(
                    width: size.width * 0.44,
                    height: AppLayout.getHeight(210),
                    padding: EdgeInsets.symmetric(
                        vertical: AppLayout.getHeight(15),
                        horizontal: AppLayout.getWidth(15)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          AppLayout.getHeight(
                            18,
                          ),
                        ),
                        color: Color.fromARGB(255, 173, 61, 98)),
                    child: Column(
                      children: [
                        Text("To watch with your loved one.",
                            style: Styles.textStyle.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Gap(AppLayout.getHeight(15)),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                  text: "😍", style: TextStyle(fontSize: 38)),
                              TextSpan(
                                  text: "🥰", style: TextStyle(fontSize: 50)),
                              TextSpan(
                                  text: "😘", style: TextStyle(fontSize: 38)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
