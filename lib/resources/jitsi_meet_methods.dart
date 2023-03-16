import 'package:flutter/material.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:vaarta/resources/auth_methods.dart';
import 'package:vaarta/resources/firestor_methods.dart';

class jitsiMethod{
  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();
  void createMeeting({required String roomName,
  required bool isAudioMuted,
  required bool isVideoMuted,
  String username = ''
  }) async{
    String name;
    if(username.isEmpty) {
      name = _authMethods.user.displayName!;
    }
    else {
      name = username;
    }

    var options = JitsiMeetingOptions(roomNameOrUrl: roomName,
    userDisplayName: name,
    userEmail: _authMethods.user.email,
    userAvatarUrl: _authMethods.user.photoURL,
    isAudioMuted: isAudioMuted,
    isVideoMuted: isVideoMuted);
    _firestoreMethods.addToMeetingHistory(roomName);
    await JitsiMeetWrapper.joinMeeting(options: options);
  }
}
