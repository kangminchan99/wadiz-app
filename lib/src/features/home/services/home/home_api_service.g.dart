// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_api_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(homeApiService)
final homeApiServiceProvider = HomeApiServiceProvider._();

final class HomeApiServiceProvider
    extends $FunctionalProvider<HomeApi, HomeApi, HomeApi>
    with $Provider<HomeApi> {
  HomeApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeApiServiceHash();

  @$internal
  @override
  $ProviderElement<HomeApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HomeApi create(Ref ref) {
    return homeApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeApi>(value),
    );
  }
}

String _$homeApiServiceHash() => r'fd9ded8927a7316b41d3e6a32825b84419b09d8b';
