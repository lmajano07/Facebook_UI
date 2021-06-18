import 'package:facebook_ui/models/models.dart';

class Story {
  final User user;
  final String? imageUrl;
  final bool isViewed;

  const Story({
    required this.user,
    this.imageUrl,
    this.isViewed = false,
  });
}
