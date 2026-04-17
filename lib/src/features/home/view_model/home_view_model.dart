import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz/src/features/home/models/home_model.dart';
import 'package:wabiz/src/features/home/repositories/home/home_repo.dart';
import 'package:wabiz/src/shared/model/category.dart';

part 'home_view_model.freezed.dart';
part 'home_view_model.g.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({@Default([]) List<HomeItemModel> categories}) =
      _HomeState;
}

@riverpod
class HomeViewModel extends _$HomeViewModel {
  HomeRepo? _homeRepo;

  @override
  HomeState? build() {
    _homeRepo = ref.watch(homeRepoProvider);
    return null;
  }

  update(List<HomeItemModel> categories) {
    state = state?.copyWith(categories: [...categories]);
  }

  Future<HomeModel?> fetchHomeData() async {
    final result = await _homeRepo?.getHomeProjects();
    update(result?.projects ?? []);
    return result;
  }
}

@riverpod
Future<HomeModel> fetchHomeProjects(ref) async {
  try {
    final result = await ref
        .watch(homeViewModelProvider.notifier)
        .fetchHomeData();
    return result ?? HomeModel();
  } catch (e) {
    return HomeModel();
  }
}

@riverpod
Future<List<CategoryModel>> fetchHomeCategories(ref) async {
  await Future.delayed(Duration(milliseconds: 2000));
  List<CategoryModel> categories = [
    CategoryModel(
      id: 1,
      iconPath: 'assets/icons/categories/1.png',
      title: "펀딩+",
    ),
    CategoryModel(
      id: 5,
      iconPath: 'assets/icons/categories/5.png',
      title: "혜택",
    ),
    CategoryModel(
      id: 2,
      iconPath: 'assets/icons/categories/2.png',
      title: "오픈예정",
    ),
    CategoryModel(
      id: 6,
      iconPath: 'assets/icons/categories/6.png',
      title: "펀딩체험단",
    ),
    CategoryModel(
      id: 3,
      iconPath: 'assets/icons/categories/3.png',
      title: "스토어",
    ),
    CategoryModel(
      id: 7,
      iconPath: 'assets/icons/categories/7.png',
      title: "뷰티워크",
    ),
    CategoryModel(
      id: 4,
      iconPath: 'assets/icons/categories/4.png',
      title: "예약구매",
    ),
    CategoryModel(
      id: 8,
      iconPath: 'assets/icons/categories/8.png',
      title: "새학기출발",
    ),
    CategoryModel(
      id: 5,
      iconPath: 'assets/icons/categories/5.png',
      title: "혜택",
    ),
    CategoryModel(
      id: 9,
      iconPath: 'assets/icons/categories/9.png',
      title: "클래스수강",
    ),
  ];
  return categories;
}
