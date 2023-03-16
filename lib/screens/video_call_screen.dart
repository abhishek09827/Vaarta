import 'package:flutter/material.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:vaarta/resources/auth_methods.dart';
import 'package:vaarta/resources/jitsi_meet_methods.dart';
import 'package:vaarta/utils/colors.dart';
import 'package:vaarta/widgets/meeting_options.dart';
class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController textEditingController;
  late TextEditingController nameController;
  bool isAudioMuted = true;
  bool isVideoMuted = true;

  @override
  void initState() {
    textEditingController = TextEditingController();
    nameController = TextEditingController(
        text: _authMethods.user.displayName
    );
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
    textEditingController.dispose();
    nameController.dispose();

  }
  _joinMeeting() {
    jitsiMethod().createMeeting(
        roomName: textEditingController.text,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
        username: nameController.text
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text('Join Meeting',
          style: TextStyle(
              fontSize: 18
          ),
        ),centerTitle: true,
        
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              controller: textEditingController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Room ID',
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller: nameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Name',
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)
              ),
            ),
          ),
          const SizedBox(
            height: 20,),
            InkWell(
              onTap: _joinMeeting,
              child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Join',
                    style: TextStyle(
                      fontSize: 16

                  ),),
              ),
            ),
          const SizedBox(
            height: 20,

          ),
          MeetingOptions(text: 'Don\'t join the meeting ',
            isMute: isAudioMuted,
            onChange: onAudioMuted,),
          MeetingOptions(text: 'Turn Off my Video',
            isMute: isAudioMuted,
            onChange: onVideoMuted,)



        ]
      ),
    );
  }

  onAudioMuted(bool p1) {
    setState(() {
      isAudioMuted = p1;
    });
  }

  onVideoMuted(bool p1) {
    setState(() {
      isVideoMuted = p1;
    });
  }
}
