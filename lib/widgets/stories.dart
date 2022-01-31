import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/models/models.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({Key? key, required this.currentUser, required this.stories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: StoryCard(
                isAddStory: true,
                currentUser: currentUser,
              ),
            );
          }
          final Story story = stories[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: StoryCard(
              story: story,
            ),
          );
        },
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User? currentUser;
  final Story? story;

  const StoryCard(
      {Key? key, this.isAddStory = false, this.currentUser, this.story})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // ignore: avoid_print
        isAddStory ? print('Add Story') : print(story!.user.name);
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: isAddStory ? currentUser!.imageUrl : story!.imageUrl,
              height: double.infinity,
              width: 110,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: double.infinity,
            width: 110,
            decoration: BoxDecoration(
              gradient: Palette.storyGradient,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: isAddStory
                ? Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.add),
                      iconSize: 30,
                      color: Palette.facebookBlue,
                      // ignore: avoid_print
                      onPressed: () => print('Add new story'),
                    ),
                  )
                : ProfileAvataar(
                    hasBorder: !story!.isViewed,
                    imageUrl: story!.user.imageUrl,
                  ),
          ),
          Positioned(
            left: 8,
            bottom: 8,
            right: 8,
            child: Text(
              isAddStory ? 'Add to story' : story!.user.name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
