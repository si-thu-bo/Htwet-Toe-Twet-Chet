// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navi_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NaviViewModel)
final naviViewModelProvider = NaviViewModelProvider._();

final class NaviViewModelProvider
    extends $NotifierProvider<NaviViewModel, int> {
  NaviViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'naviViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$naviViewModelHash();

  @$internal
  @override
  NaviViewModel create() => NaviViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$naviViewModelHash() => r'e6ca2913f5acaee7e8777c574d8d63657f962cb4';

abstract class _$NaviViewModel extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
