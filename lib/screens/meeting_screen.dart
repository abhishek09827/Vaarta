import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:vaarta/widgets/home_meeting_button.dart';
import 'package:vaarta/resources/jitsi_meet_methods.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);
  final jitsiMethod _jitsiMethod = jitsiMethod();

  CreateNewMeeting() async{
    var random = Random();
    String roomName = (random.nextInt(100000000)+10000000).toString() ;

    _jitsiMethod.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) async{
    Navigator.pushNamed(context, '/video');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeMeetingButton(onPressed: CreateNewMeeting,
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
