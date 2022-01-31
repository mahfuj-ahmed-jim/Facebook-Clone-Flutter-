import 'models.dart';

class Story {
  final User user;
  final String imageUrl;
  late bool isViewed;

  Story({required this.user, required this.imageUrl, this.isViewed = false});
}
