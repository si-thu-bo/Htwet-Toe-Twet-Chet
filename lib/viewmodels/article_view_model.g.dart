// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ArticleViewModel)
final articleViewModelProvider = ArticleViewModelProvider._();

final class ArticleViewModelProvider
    extends $AsyncNotifierProvider<ArticleViewModel, List<Article>> {
  ArticleViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'articleViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$articleViewModelHash();

  @$internal
  @override
  ArticleViewModel create() => ArticleViewModel();
}

String _$articleViewModelHash() => r'a174bea903e51fde1f0a934117945f885c48624f';

abstract class _$ArticleViewModel extends $AsyncNotifier<List<Article>> {
  FutureOr<List<Article>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Article>>, List<Article>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Article>>, List<Article>>,
              AsyncValue<List<Article>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
