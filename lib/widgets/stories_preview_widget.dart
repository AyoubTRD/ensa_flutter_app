import 'package:ensa/utils/constants.dart';
import 'package:ensa/widgets/story_preview_widget.dart';
import 'package:flutter/material.dart';

class StoriesPreview extends StatelessWidget {
  const StoriesPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> storyWidgets = [];

    for (int i = 0; i < stories.length; i++) {
      final bool isLast = i == stories.length - 1;
      storyWidgets.add(
        Padding(
          padding: EdgeInsets.only(
            right: isLast ? kDefaultPadding : 8.0,
            left: kDefaultPadding,
          ),
          child: StoryPreview(story: stories[i]),
        ),
      );
    }

    return ListView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: kDefaultPadding,
            right: 8.0,
          ),
          child: StoryPreview(createStory: true),
        ),
        ...storyWidgets,
      ],
    );
  }
}