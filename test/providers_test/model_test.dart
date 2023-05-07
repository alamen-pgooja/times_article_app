import 'package:flutter_test/flutter_test.dart';
import 'package:pop_articles/models/most_popular_list.dart';

void main() {
  test('MostPopularList.fromJson returns a valid object', () {
    final Map<String, dynamic> jsonData = {
      "status": "OK",
      "num_results": 2,
      "results": [
        {
          "uri": "nyt://article/7e229034-b8d6-5291-9812-f726d949c6f8",
          "url": "https://www.nytimes.com/2022/05/04/sports/soccer/leicester-brendan-rodgers.html",
          "title": "Rodgers Turns Down Tottenham to Stay With Leicester",
          "abstract": "Brendan Rodgers, who had been linked with the job at Tottenham, has agreed to a new five-year contract with Leicester City.",
          "published_date": "2022-05-04",
          "byline": "By Rory Smith"
        },
        {
          "uri": "nyt://article/fc00a48a-57b7-5db9-9e03-86e05f2942f2",
          "url": "https://www.nytimes.com/2022/05/03/business/dealbook/warren-buffett-berkshire-hathaway.html",
          "title": "Buffett's Berkshire Reports Lower First-Quarter Earnings",
          "abstract": "Operating earnings at Berkshire Hathaway fell 16 percent, dragged down by the company's industrial, railroad and insurance businesses.",
          "published_date": "2022-05-03",
          "byline": "By Lauren Hirsch"
        }
      ]
    };

    final MostPopularList result = MostPopularList.fromJson(jsonData);
    expect(result.status, 'OK');
    expect(result.numResults, 2);
    expect(result.articles?.length, 2);

    final article1 = result.articles![0];
    expect(article1.uri, 'nyt://article/7e229034-b8d6-5291-9812-f726d949c6f8');
    expect(article1.url, 'https://www.nytimes.com/2022/05/04/sports/soccer/leicester-brendan-rodgers.html');
    expect(article1.title, 'Rodgers Turns Down Tottenham to Stay With Leicester');
    expect(article1.articlesListAbstract, 'Brendan Rodgers, who had been linked with the job at Tottenham, has agreed to a new five-year contract with Leicester City.');
    expect(article1.publishedDate.toString().contains( '2022-05-04'),true);
    expect(article1.byline, 'By Rory Smith');
  });
}
