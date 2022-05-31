import 'package:news_app/services/news_services.dart';

class NewsFunctions {
  final NewsServices services = NewsServices();
  List<Map<String, dynamic>> topHeadlines = [];
  List<Map<String, dynamic>> businessNews = [];
  List<Map<String, dynamic>> sportsNews = [];
  List<Map<String, dynamic>> healthNews = [];
  List<Map<String, dynamic>> entertainmentNews = [];
  List<Map<String, dynamic>> latestNews = [];
  List<Map<String, dynamic>> searchedNews = [];
  List<Map<String, dynamic>> savedNews = [];
  int page = 0;

  Future<void> getHeadlineNews({
    int? next,
  }) async {
    print("getting TopHeadlinesnews");
    topHeadlines = await services.getTopHeadlinesNews(page: next ?? 1);
    print("News gotten sucessful");
    print(topHeadlines);
  }

  Future<void> getBusinessNews({
    int? next,
  }) async {
    print("getting Businessnews");
    businessNews = await services.getBusinessNews(page: next ?? 1);
    print("News gotten sucessful");
    print(businessNews);
  }

  Future<void> getSportsNews({
    int? next,
  }) async {
    print("getting Sportsnews");
    sportsNews = await services.getSportsNews(page: next ?? 1);
    print("News gotten sucessful");
    print(sportsNews);
  }

  Future<void> getHealthNews({
    int? next,
  }) async {
    print("getting Healthnews");
    healthNews = await services.getHealthNews(page: next ?? 1);
    print("News gotten sucessful");
    print(healthNews);
  }

  Future<void> getEntertainmentNews({
    int? next,
  }) async {
    print("getting Entertainmentnews");
    entertainmentNews = await services.getEntertainmentNews(page: next ?? 1);
    print("News gotten sucessful");
    print(entertainmentNews);
  }

  Future<void> getLatestNews({
    int? next,
  }) async {
    print("getting Latestnews");
    latestNews = await services.getLatestNews(page: next ?? 1);
    print("News gotten sucessful");
    print(latestNews);
  }

  Future<void> getSearchedNews({required String query}) async {
    page = page + 1;
    print("getting $query news");
    searchedNews = await services.getSearchedNews(q: query,page: page);
    print("News gotten sucessful");
  }

  getMore({required String newsType,}) {
      page = page + 1;
      //get data
      _fetchData(index: page, news: newsType);
  }

  _fetchData({required String news, required int index}) async {
    //  final String value;
    switch (news) {
      case "TopHeadlines":
        await getHeadlineNews(
          next: index,
        );
        break;
      case "Business":
        await getBusinessNews(
          next: index,
        );
        break;
      case "Sports":
        await getSportsNews(
          next: index,
        );
        break;
      case "Entertainments":
        await getEntertainmentNews(
          next: index,
        );
        break;
      case "Health":
        await getHealthNews(
          next: index,
        );
        break;
      case "Latest":
        await getLatestNews(
          next: index,
        );
        break;
      default:
    }
  }
}
