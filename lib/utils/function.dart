import 'package:news_app/services/news_services.dart';

class NewsFunctions {

final NewsServices services = NewsServices();
List<Map<String,dynamic>> topHeadlines = [];
List<Map<String,dynamic>> businessNews = [];
List<Map<String,dynamic>> sportsNews = [];
List<Map<String,dynamic>> healthNews = [];
List<Map<String,dynamic>> entertainmentNews = [];
List<Map<String,dynamic>> searchedNews = [];
Map<String,dynamic> latestNews = {};

Future<void> getTopHeadlines()async{
print("getting top headlines");
topHeadlines = await services.getTopHeadlinesNews();
print("News gotten sucessful");
}

Future<void> getBusinessNews()async{
print("getting business news");
businessNews = await services.getBusinessNews();
print("News gotten sucessful");
}

Future<void> getSportsNews()async{
print("getting sports news");
sportsNews = await services.getSportsNews();
print("News gotten sucessful");
}

Future<void> getHealthNews()async{
print("getting entertainment news");
healthNews = await services.getHealthNews();
print("News gotten sucessful");
}

Future<void> getEntertainmentNews()async{
print("getting health news");
entertainmentNews = await services.getEntertainmentNews();
print("News gotten sucessful");
}

Future<void> getLatestNews()async{
print("getting latest news");
latestNews = await services.getlatestNews();
print("News gotten sucessful");
}

Future<void> getSearchedNews()async{
print("getting latest news");
searchedNews = await services.getSearchedNews();
print("News gotten sucessful");
}
}