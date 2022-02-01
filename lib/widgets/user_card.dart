import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final User currentUser;
  final bool isFullName;

  const UserCard({Key? key, required this.currentUser, this.isFullName = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // ignore: avoid_print
        print(currentUser.name);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvataar(imageUrl: currentUser.imageUrl),
          const SizedBox(
            width: 6,
          ),
          Flexible(
            child: Text(
              isFullName ? currentUser.name : currentUser.name.split(' ').first,
              style: const TextStyle(
                fontSize: 15,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
