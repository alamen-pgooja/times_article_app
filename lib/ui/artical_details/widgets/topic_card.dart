import 'package:flutter/material.dart';

import '../../../core/utils/app_text_style.dart';

class TopicCard extends StatelessWidget {
  const TopicCard({
    super.key,
    required this.topic,
  });

  final String topic;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        margin: const EdgeInsets.all(
          4,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(16.0),
          ),
          color: Colors.grey.withOpacity(0.4),
        ),
        child: Center(
          child: Text(
            topic,
            style: medium10(
              context: context,
            ),
          ),
        ),
      ),
    );
  }
}
