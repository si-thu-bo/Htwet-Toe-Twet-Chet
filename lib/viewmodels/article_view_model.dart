import 'package:htwettoe_twetchet/api/article_api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/article.dart';
part 'article_view_model.g.dart';

@riverpod
class ArticleViewModel extends _$ArticleViewModel {
  @override
  Future<List<Article>> build() {
    return ref.watch(articleApiServicProvider).fetchArticles(); 
  }
}
