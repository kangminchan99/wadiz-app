// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HomeViewModel)
final homeViewModelProvider = HomeViewModelProvider._();

final class HomeViewModelProvider
    extends $NotifierProvider<HomeViewModel, HomeState?> {
  HomeViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeViewModelHash();

  @$internal
  @override
  HomeViewModel create() => HomeViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeState? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeState?>(value),
    );
  }
}

String _$homeViewModelHash() => r'65c67808d2e4b6fb547b8c54981f8bdbcb78b655';

abstract class _$HomeViewModel extends $Notifier<HomeState?> {
  HomeState? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<HomeState?, HomeState?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<HomeState?, HomeState?>,
              HomeState?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(fetchHomeProjects)
final fetchHomeProjectsProvider = FetchHomeProjectsProvider._();

final class FetchHomeProjectsProvider
    extends
        $FunctionalProvider<
          AsyncValue<HomeModel>,
          HomeModel,
          FutureOr<HomeModel>
        >
    with $FutureModifier<HomeModel>, $FutureProvider<HomeModel> {
  FetchHomeProjectsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchHomeProjectsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchHomeProjectsHash();

  @$internal
  @override
  $FutureProviderElement<HomeModel> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<HomeModel> create(Ref ref) {
    return fetchHomeProjects(ref);
  }
}

String _$fetchHomeProjectsHash() => r'f6135b3b8a5b036c88d9934939ab1f58ff291635';

@ProviderFor(fetchHomeCategories)
final fetchHomeCategoriesProvider = FetchHomeCategoriesProvider._();

final class FetchHomeCategoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CategoryModel>>,
          List<CategoryModel>,
          FutureOr<List<CategoryModel>>
        >
    with
        $FutureModifier<List<CategoryModel>>,
        $FutureProvider<List<CategoryModel>> {
  FetchHomeCategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchHomeCategoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchHomeCategoriesHash();

  @$internal
  @override
  $FutureProviderElement<List<CategoryModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CategoryModel>> create(Ref ref) {
    return fetchHomeCategories(ref);
  }
}

String _$fetchHomeCategoriesHash() =>
    r'f0eff50c40c1a30bd1d6384d04af91072f796e01';
