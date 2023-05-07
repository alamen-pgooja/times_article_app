import 'package:flutter/foundation.dart';
import 'package:pop_articles/core/utils/constants.dart';

import '../core/live_data/live_data.dart';
import '../core/live_data/ui_state.dart';
import '../models/most_popular_list.dart';
import '../network/network_manager.dart';

class HomeProvider with ChangeNotifier {
  final NetworkManager networkManager;

  final LiveData<UIState<MostPopularList>> _homeUiState =
      LiveData<UIState<MostPopularList>>();

  HomeProvider(this.networkManager) {
    //default value 1 day
    getArticleListRes(Constants.defaultDropDownValue);
  }

  LiveData<UIState<MostPopularList>> get homeUiState => _homeUiState;

  Future<dynamic> getArticleListRes(int day) async {
    late dynamic repose;
    try {
      homeUiState.setValue(IsLoading());
      notifyListeners();
      repose = await networkManager.get("$day.json");
      var list = MostPopularList.fromJson(repose);
      list.articles?.length != 0
          ? _homeUiState.setValue(Success(list))
          : _homeUiState.setValue(Empty());
      notifyListeners();
    } catch (e) {
      _homeUiState.setValue(Failure(e.toString()));
    }
    notifyListeners();
  }
}