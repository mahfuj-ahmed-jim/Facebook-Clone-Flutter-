// ignore_for_file: avoid_print

import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/models/models.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({Key? key, required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDekstop(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5 : 0),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          : null,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvataar(imageUrl: currentUser.imageUrl),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: TextButton(
                        onPressed: () => print('post'),
                        child: const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'What\'s on your mind?',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ))))
              ],
            ),
            const Divider(
              height: 10,
              thickness: 0.5,
            ),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      print('Live');
                    },
                    icon: const Icon(
                      Icons.videocam,
                      color: Colors.red,
                    ),
                    label: const Text('Live'),
                  ),
                  const VerticalDivider(
                    width: 8,
                  ),
                  TextButton.icon(
                    onPressed: () {
                      print('Photo');
                    },
                    icon: const Icon(
                      Icons.photo_library,
                      color: Colors.green,
                    ),
                    label: const Text('Photo'),
                  ),
                  const VerticalDivider(
                    width: 8,
                  ),
                  TextButton.icon(
                    onPressed: () {
                      print('Room');
                    },
                    icon: const Icon(
                      Icons.video_call,
                      color: Colors.purpleAccent,
                    ),
                    label: const Text('Room'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
