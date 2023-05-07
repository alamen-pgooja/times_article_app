import 'package:flutter/material.dart';
import 'package:pop_articles/core/shared_widgets/image_placeholder.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../core/utils/app_sizes.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/dividers.dart';
import '../../../models/article.dart';
import '../../artical_details/screens/article_detail.dart';

class ArticlesListItem extends StatelessWidget {
  final Article? article;

  const ArticlesListItem({this.article, super.key});

  @override
  Widget build(BuildContext context) {
    String imageUrl = article!.media!.isNotEmpty
        ? article!.media![0].mediaMetadata![0].url!
        : Constants.defaultImage;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ArticleDetails.routeKey,
            arguments: article);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "from: ${article!.source} >",
              style: bold10(context: context),
            ),
            Dividers.vertical(8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${article!.title}",
                          style: bold16(
                              context: context, height: AppSizes.height(0.8)),
                        ),
                        Dividers.vertical(6),
                        Text(
                          "${article!.articlesListAbstract}",
                          style: regular10(context: context),
                        ),
                        Dividers.vertical(6),
                        Text(
                          timeago.format(article!.publishedDate!),
                          style: regular10(context: context)
                              .copyWith(color: Colors.grey),
                        ),
                      ],
                    )),
                Dividers.horizontal(8),
                Expanded(child:ImagePlaceholder(
                  imageUrl: imageUrl,
                  width: AppSizes.width(100),
                  height: AppSizes.height(100),
                ),),
              ],
            ),
            Dividers.vertical(8),
            Container(
              height: 0.3,
              color: Colors.grey.shade400,
            )
          ],
        ),
      ),
    );
  }
}
