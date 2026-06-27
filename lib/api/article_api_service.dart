import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:htwettoe_twetchet/config/config.dart';
import 'package:htwettoe_twetchet/model/article.dart';

class ArticleApiService {
  final _dio = Dio()
    ..options.baseUrl = baseUrl
    ..options.connectTimeout = Duration(seconds: 5)
    ..options.receiveTimeout = Duration(seconds: 5);

  final _articleRoute = '/api/articles';

  Future<List<Article>> fetchArticles() async {
    try {
      final response = await _dio.get(_articleRoute);
      if (response.statusCode == 200) {
        List<dynamic> resData = response.data['data'];
        return resData.map((arti) => Article.fromJson(arti)).toList();
      } else {
        
        throw Exception('ဆောင်းပါးများယူလို့မရပါ။');
      }
    } catch (e) {
      print('❌ အမှားအစစ်က ဒီမှာပါ: $e');
      throw Exception('Server နှင့် ချိတ်ဆက်လို့ မရပါ။');
    }
  }
}

final articleApiServicProvider = Provider<ArticleApiService>((ref) {
  return ArticleApiService();
});
