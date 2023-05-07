import 'package:flutter/cupertino.dart';

import '../../../models/article.dart';
import 'articles_list_item.dart';

class ArticlesList extends StatefulWidget {
  final List<Article>? articles;

  const ArticlesList({this.articles, super.key});

  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.articles!.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return ArticlesListItem(
          article: widget.articles![index],
        );
      },
    );
  }
}
