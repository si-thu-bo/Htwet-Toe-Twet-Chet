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
    extends $NotifierProvider<ArticleViewModel, List<Article>> {
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

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Article> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Article>>(value),
    );
  }
}

String _$articleViewModelHash() => r'c21a88885dd54785f390467ee220c4f324feef24';

abstract class _$ArticleViewModel extends $Notifier<List<Article>> {
  List<Article> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<Article>, List<Article>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Article>, List<Article>>,
              List<Article>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
