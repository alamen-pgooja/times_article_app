import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pop_articles/core/dp/locater.dart';
import 'package:pop_articles/core/live_data/ui_state.dart';
import 'package:pop_articles/models/most_popular_list.dart';
import 'package:pop_articles/network/network_manager.dart';
import 'package:pop_articles/providers/home_provider.dart';

void main() {
  group('HomeProvider', () {
    late HomeProvider homeProvider;
    late NetworkManager networkManager;


    setUp(() async {
      if (!locator.isRegistered<NetworkManager>()) {
        setupLocators();
      }
      await dotenv.load();
      networkManager = NetworkManager(dotenv.env['baseUrl']!);
      homeProvider = HomeProvider(locator<NetworkManager>());
    });

    test('should get MostPopularList for day 1', () async {
      final result = await homeProvider.getArticleListRes(1);
      expect(homeProvider.homeUiState.value, isA<Success<MostPopularList>>());
      expect((homeProvider.homeUiState.value as Success).data, isA<MostPopularList>());
    });

    test('should handle network exception', () async {
      final result = await homeProvider.getArticleListRes(-1);
      expect(homeProvider.homeUiState.value, isA<Failure>());
    });
  });
}
