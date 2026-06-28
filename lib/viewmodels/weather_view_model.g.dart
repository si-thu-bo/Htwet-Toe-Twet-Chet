// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WeatherViewModel)
final weatherViewModelProvider = WeatherViewModelProvider._();

final class WeatherViewModelProvider
    extends $AsyncNotifierProvider<WeatherViewModel, WeatherData> {
  WeatherViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'weatherViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$weatherViewModelHash();

  @$internal
  @override
  WeatherViewModel create() => WeatherViewModel();
}

String _$weatherViewModelHash() => r'c413c13845ca55467eebfca1dd13a325d009d632';

abstract class _$WeatherViewModel extends $AsyncNotifier<WeatherData> {
  FutureOr<WeatherData> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<WeatherData>, WeatherData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<WeatherData>, WeatherData>,
              AsyncValue<WeatherData>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
