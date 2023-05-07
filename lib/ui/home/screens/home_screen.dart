import 'package:flutter/material.dart';
import 'package:pop_articles/core/shared_widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

import '../../../core/live_data/ui_state.dart';
import '../../../models/most_popular_list.dart';
import '../../../providers/home_provider.dart';
import '../widgets/articles_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: CustomAppBar(
          title: 'Articles',
          onDurationChanged: (int day) {
            provider.getArticleListRes(day);
          },
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              provider.homeUiState.value is IsLoading
                  ? LinearProgressIndicator()
                  : provider.homeUiState.value is Success
                      ? Expanded(
                          child: ArticlesList(
                            articles: (((provider.homeUiState.value) as Success)
                                    .data as MostPopularList)
                                .articles,
                          ),
                        )
                      : Container(),
            ],
          ),
        ),
      );
    });
  }
}
