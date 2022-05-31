import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsServices {

 Future<List<Map<String, dynamic>>> getTopHeadlinesNews({required int page,}) async {
   print(page);
    try {
      http.Response response = await http.get(
         Uri.parse(
              "https://free-news.p.rapidapi.com/v1/search?q=headline&page_size=15&page=$page"),
          headers: {
            'X-RapidAPI-Host': 'free-news.p.rapidapi.com',
            'X-RapidAPI-Key':
                '84485df176mshcf9174902c4b3f7p1b0b79jsn5b237dc96eb5'
          });
       final data = jsonDecode(response.body)["articles"];
      List<Map<String, dynamic>> result = List<Map<String, dynamic>>.from(data.map((e) => e ));
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getEntertainmentNews({required int page,}) async {
   print(page);
    try {
      http.Response response = await http.get(
         Uri.parse(
              "https://free-news.p.rapidapi.com/v1/search?q=entertainment&page_size=15&page=$page"),
          headers: {
            'X-RapidAPI-Host': 'free-news.p.rapidapi.com',
            'X-RapidAPI-Key':
                '84485df176mshcf9174902c4b3f7p1b0b79jsn5b237dc96eb5'
          });
       final data = jsonDecode(response.body)["articles"];
      List<Map<String, dynamic>> result = List<Map<String, dynamic>>.from(data.map((e) => e ));
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getBusinessNews({required int page,}) async {
   print(page);
    try {
      http.Response response = await http.get(
         Uri.parse(
              "https://free-news.p.rapidapi.com/v1/search?q=business&page_size=15&page=$page"),
          headers: {
            'X-RapidAPI-Host': 'free-news.p.rapidapi.com',
            'X-RapidAPI-Key':
                '84485df176mshcf9174902c4b3f7p1b0b79jsn5b237dc96eb5'
          });
       final data = jsonDecode(response.body)["articles"];
      List<Map<String, dynamic>> result = List<Map<String, dynamic>>.from(data.map((e) => e ));
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getSportsNews({required int page,}) async {
   print(page);
    try {
      http.Response response = await http.get(
         Uri.parse(
              "https://free-news.p.rapidapi.com/v1/search?q=sports&page_size=15&page=$page"),
          headers: {
            'X-RapidAPI-Host': 'free-news.p.rapidapi.com',
            'X-RapidAPI-Key':
                '84485df176mshcf9174902c4b3f7p1b0b79jsn5b237dc96eb5'
          });
       final data = jsonDecode(response.body)["articles"];
      List<Map<String, dynamic>> result = List<Map<String, dynamic>>.from(data.map((e) => e));
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getLatestNews({required int page,}) async {
   print(page);
    try {
      http.Response response = await http.get(
         Uri.parse(
              "https://free-news.p.rapidapi.com/v1/search?q=latest&page_size=15&page=$page"),
          headers: {
            'X-RapidAPI-Host': 'free-news.p.rapidapi.com',
            'X-RapidAPI-Key':
                '84485df176mshcf9174902c4b3f7p1b0b79jsn5b237dc96eb5'
          });
       final data = jsonDecode(response.body)["articles"];
      List<Map<String, dynamic>> result = List<Map<String, dynamic>>.from(data.map((e) => e));
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getHealthNews({required int page,}) async {
   print(page);
    try {
      http.Response response = await http.get(
         Uri.parse(
              "https://free-news.p.rapidapi.com/v1/search?q=health&page_size=15&page=$page"),
          headers: {
            'X-RapidAPI-Host': 'free-news.p.rapidapi.com',
            'X-RapidAPI-Key':
                '84485df176mshcf9174902c4b3f7p1b0b79jsn5b237dc96eb5'
          });
       final data = jsonDecode(response.body)["articles"];
      List<Map<String, dynamic>> result = List<Map<String, dynamic>>.from(data.map((e) => e));
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getSearchedNews(
      {required String q,required int page,}) async {
    try {
      http.Response response = await http.get(
          Uri.parse(
              "https://free-news.p.rapidapi.com/v1/search?q=$q&page_size=15&page=$page"),
          headers: {
            'X-RapidAPI-Host': 'free-news.p.rapidapi.com',
            'X-RapidAPI-Key':
                '84485df176mshcf9174902c4b3f7p1b0b79jsn5b237dc96eb5'
          });
      final data = jsonDecode(response.body)["articles"];
      List<Map<String, dynamic>> result =
          List<Map<String, dynamic>>.from(data.map((e) => e));
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
