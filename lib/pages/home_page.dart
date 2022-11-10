import 'package:book_tickets/pages/profile_page.dart';
import 'package:book_tickets/pages/welcome_page.dart';
import 'package:book_tickets/pages/search_page.dart';
import 'package:book_tickets/pages/tickets_page.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:book_tickets/pages/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  late PageController pc;

  

  setCurrentPage(page){
    setState(() {
      currentPage = page;
    });
  }
  @override
  void initState(){
    super.initState();
    pc = PageController(initialPage: currentPage);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pc,
        children: [
          WelcomePage(),
          SearchPage(),
          TicketsPage(),
          ProfilePage(),
        ],
        onPageChanged: setCurrentPage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: const Color.fromRGBO(186, 153, 124, 1),
        unselectedItemColor: const Color.fromRGBO(201, 173, 146, 1),
        items: [
          BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
                label: 'Ticktes'),
            BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
                label: 'Profile')
        ],
        onTap: (page){
          pc.animateToPage(page, duration: Duration(milliseconds: 400), curve: Curves.ease);
        },
      ),
    );
  }
}
