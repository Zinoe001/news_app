import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsServices {
  Future<List<Map<String, dynamic>>> getTopHeadlinesNews() async {
    try {
      print('Collecting data right now');
      http.Response response = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=ng&apiKey=dcd943206b294923be5b512b30ed7b37"));
      final data = jsonDecode(response.body)["articles"];
      List<Map<String, dynamic>> result =
          List<Map<String, dynamic>>.from(data.map((e) => e));
      print(result);
      print("finished with topHeadlines services");
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getEntertainmentNews() async {
    try {
      print('Collecting data right now');
      http.Response response = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=us&category=entertainment&apiKey=dcd943206b294923be5b512b30ed7b37"));
      final data = jsonDecode(response.body)["articles"];
      List<Map<String, dynamic>> result =
          List<Map<String, dynamic>>.from(data.map((e) => e));
      print(result);
      print("finished with Entertainment services");
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getHealthNews() async {
    try {
      print('Collecting data right now');
      http.Response response = await http.get(Uri.parse(
        "http://api.mediastack.com/v1/news?access_key=f87c7d9891de8ea31a2b2ec70c1a16ea&keywords=health&countries=ng",
      ));
      final data = jsonDecode(response.body)["data"];
      List<Map<String, dynamic>> result =
          List<Map<String, dynamic>>.from(data.map((e) => e));
      print(result);
      print("finished with health services");
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getSportsNews() async {
    try {
      print('Collecting data right now');
      http.Response response = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=ng&category=sports&apiKey=dcd943206b294923be5b512b30ed7b37"));
      final data = jsonDecode(response.body)["articles"];
      List<Map<String, dynamic>> result =
          List<Map<String, dynamic>>.from(data.map((e) => e));
      print(result);
      print("finished with sports services");
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getBusinessNews() async {
    try {
      print('Collecting data right now');
      http.Response response = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=ng&category=business&apiKey=dcd943206b294923be5b512b30ed7b37"));
      final businessData = jsonDecode(response.body)["articles"];
      List<Map<String, dynamic>> result =
          List<Map<String, dynamic>>.from(businessData.map((e) => e));
      print(result);
      print("finished with business services");
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getlatestNews() async {
    try {
      print('Collecting data right now');
      http.Response response = await http.get(
          Uri.parse(
              "https://newscatcher.p.rapidapi.com/v1/latest_headlines?lang=en&media=true"),
          headers: {
            'X-RapidAPI-Host': 'free-news.p.rapidapi.com',
            'X-RapidAPI-Key':
                '84485df176mshcf9174902c4b3f7p1b0b79jsn5b237dc96eb5'
          });
      final data = jsonDecode(response.body);
      print(data);
      print("finished with latest services");
      return data;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getSearchedNews() async {
    try {
      print('Collecting data right now');
      http.Response response = await http.get(
          Uri.parse(
              "https://free-news.p.rapidapi.com/v1/search?q=lagos&page_size:5"),
          headers: {
            'X-RapidAPI-Host': 'free-news.p.rapidapi.com',
            'X-RapidAPI-Key':
                '84485df176mshcf9174902c4b3f7p1b0b79jsn5b237dc96eb5'
          });
      final data = jsonDecode(response.body)["articles"];
      List<Map<String, dynamic>> result =
          List<Map<String, dynamic>>.from(data.map((e) => e));
      print(result);
      print("finished with  search services");
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
