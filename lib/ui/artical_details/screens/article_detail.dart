import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pop_articles/core/shared_widgets/image_placeholder.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../core/utils/app_sizes.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/dividers.dart';
import '../../../models/article.dart';
import '../widgets/topic_card.dart';

class ArticleDetails extends StatefulWidget {
  const ArticleDetails(this._article, {Key? key}) : super(key: key);
  final Article _article;
  static const String routeKey = '/ArticleDetail';

  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  @override
  Widget build(BuildContext context) {
    String? imageUrl = Constants.defaultImage;
    if (widget._article.media!.isNotEmpty &&
        widget._article.media!.first.mediaMetadata!.isNotEmpty &&
        widget._article.media!.first.mediaMetadata!.length > 2) {
      imageUrl = widget._article.media!.first.mediaMetadata![2].url;
    }

    List topics = widget._article.adxKeywords?.split(';') ?? [];

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:  BorderRadius.only(
                    bottomRight: Radius.circular(AppSizes.radius(16)),
                    bottomLeft: Radius.circular(AppSizes.radius(16)),
                  ),
                  child: ImagePlaceholder(
                   imageUrl: imageUrl!,
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 32),
                    width: AppSizes.width(34),
                    height: AppSizes.width(34),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppSizes.radius(20)),
                      ),
                      color: Colors.white,
                    ),
                    child:  Icon(
                      Icons.arrow_back_ios_sharp,
                      color: Colors.black,
                      size: AppSizes.sp(18),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget._article.title}",
                    style: bold24(
                      context: context,
                    ),
                  ),
                  Dividers.vertical(8),
                  Text(
                    "from: ${widget._article.source} >",
                    style: bold10(context: context),
                  ),
                  Dividers.vertical(8),
                  Text(
                    "${widget._article.byline}",
                    style: regular12(context: context),
                  ),
                  Dividers.vertical(8),
                  Text(
                    "${widget._article.articlesListAbstract}",
                    style: regular14(context: context),
                  ),
                  Dividers.vertical(8),
                  Text(
                    timeago.format(widget._article.publishedDate!),
                    style: regular10(context: context)
                        .copyWith(color: Colors.grey),
                  ),
                  Dividers.vertical(8),
                  if (topics.isNotEmpty)
                    Wrap(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        for (var topic in topics) TopicCard(topic: topic),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
