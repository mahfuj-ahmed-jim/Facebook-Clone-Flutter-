import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDekstop(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5 : 0, vertical: 5),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          : null,
      child: Container(
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
                    child: CachedNetworkImage(
                      imageUrl: post.imageUrl,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(
                        color: Palette.facebookBlue,
                        strokeWidth: 3,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  )
                : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: PostStats(
                post: post,
              ),
            )
          ],
        ),
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

class PostStats extends StatelessWidget {
  final Post post;

  const PostStats({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                color: Colors.white,
                size: 10,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            Text(
              post.comments == 1
                  ? '${post.comments} Comment'
                  : '${post.comments} Comments',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              post.shares == 1
                  ? '${post.shares} Share'
                  : '${post.shares} Shares',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            PostButton(
              icon: Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey[600],
                size: 20,
              ),
              label: 'Like',
              // ignore: avoid_print
              onTap: () => print('Like'),
            ),
            PostButton(
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey[600],
                size: 20,
              ),
              label: 'Comment',
              // ignore: avoid_print
              onTap: () => print('Comment'),
            ),
            PostButton(
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey[600],
                size: 25,
              ),
              label: 'Share',
              // ignore: avoid_print
              onTap: () => print('Share'),
            ),
          ],
        )
      ],
    );
  }
}

class PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;

  const PostButton(
      {Key? key, required this.icon, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
