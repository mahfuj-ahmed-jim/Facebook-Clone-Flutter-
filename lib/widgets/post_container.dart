import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/models/models.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PostHeader(post: post),
                const SizedBox(
                  height: 4,
                ),
                Text(post.caption),
                post.imageUrl != "null"
                    ? const SizedBox.shrink()
                    : const SizedBox(
                        height: 6,
                      ),
              ],
            ),
          ),
          post.imageUrl != "null"
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(imageUrl: post.imageUrl),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  final Post post;

  const PostHeader({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvataar(imageUrl: post.user.imageUrl),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} • ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            // ignore: avoid_print
            print('More');
          },
          icon: const Icon(Icons.more_horiz),
        )
      ],
    );
  }
}
