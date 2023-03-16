import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vaarta/resources/auth_methods.dart';
import 'package:vaarta/screens/history_meeting_screen.dart';
import 'package:vaarta/screens/meeting_screen.dart';
import 'package:vaarta/utils/colors.dart';
import 'package:vaarta/widgets/home_meeting_button.dart';
import 'package:vaarta/widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  final AuthMethods _authMethods = AuthMethods();
  int _page = 0;
  onPageChanged(int page){
    setState(() {
      _page = page;
    });

  }

  List<Widget> pages = [
    MeetingScreen(),
    const HistoryMeetingScreen(),
    const Text('Contacts'),
    const Text('Settings')
    ,CustomButton(text: 'Log Out', onPressed: () => AuthMethods().SignOut())
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text('Meet & Chat'),
        centerTitle: true,

      ),
      body: pages[_page],

      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: footerColor,
          unselectedItemColor: Colors.white38,
          onTap: onPageChanged,
          unselectedFontSize: 14,
          selectedItemColor: Colors.white,
          currentIndex: _page
          // ,type: BottomNavigationBarType.fixed
      ,items: const [
        BottomNavigationBarItem(icon: Icon(
          Icons.comment_bank
        ),
        label: 'Meet & Char'),
        BottomNavigationBarItem(
            icon: Icon(

            Icons.lock_clock
        ),
            label: 'Meetings'),
        BottomNavigationBarItem(icon: Icon(
            Icons.person_2_outlined
        ),
            label: 'Contacts'),
        BottomNavigationBarItem(icon: Icon(
            Icons.settings_outlined
        ),
            label: 'Settings')
      ]),


    );
  }

  Column HistoryMeeting() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(onPressed: (){

          },
              text: 'New Meeting',
              icon: Icons.videocam,
          ),
            HomeMeetingButton(onPressed: (){

            },
              text: 'Join Meeting',
              icon: Icons.add_box_rounded,
            ),
            HomeMeetingButton(onPressed: (){

            },
              text: 'Schedule Meeting',
              icon: Icons.calendar_today,
            ),
            HomeMeetingButton(onPressed: (){

            },
              text: 'Share Screen',
              icon: Icons.arrow_upward,
            )
          ]
        ),
        const Expanded(
            child: Center(
              child: Text('Create/Join Meeting with just a click !!!',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18
        ),),
            ))
      ],

    );
  }
}
