import 'package:facebook_clone/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/models/models.dart';

class Room extends StatelessWidget {
  final List<User> onlineUsers;

  const Room({Key? key, required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CreateRoomButton(),
            );
          }
          return Container(
            margin: const EdgeInsets.all(2),
            height: 20,
            width: 20,
            color: Colors.orange,
          );
        },
      ),
    );
  }
}

class CreateRoomButton extends StatelessWidget {
  const CreateRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () => print('Create a room'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      color: Colors.white,
      borderSide: BorderSide(width: 3, color: Colors.blueAccent),
      textColor: Palette.facebookBlue,
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: Icon(
              Icons.video_call,
              size: 35,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Text('Create\nRoom'),
        ],
      ),
    );
  }
}
