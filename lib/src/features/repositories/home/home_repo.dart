import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz/src/features/models/home_model.dart';
import 'package:wabiz/src/features/services/home/home_api.dart';
import 'package:wabiz/src/features/services/home/home_api_service.dart';

part 'home_repo.g.dart';

class HomeRepo {
  HomeApi homeApiService;

  HomeRepo(this.homeApiService);

  Future<HomeModel> getHomeProjects() async {
    final response = await homeApiService.getHomeProjects();
    return response;
  }
}

@riverpod
HomeRepo homeRepo(Ref ref) {
  final service = ref.watch(homeApiServiceProvider);
  return HomeRepo(service);
}
