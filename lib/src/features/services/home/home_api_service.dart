import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz/src/core/network/dio_network_provider.dart';
import 'package:wabiz/src/features/services/home/home_api.dart';

part 'home_api_service.g.dart';

@riverpod
HomeApi homeApiService(Ref ref) {
  final dio = ref.watch(dioProvider);
  var localhost = 'localhost';
  // Platform.isAnroid 보다 아래 방법이 권장 방식
  if (defaultTargetPlatform == TargetPlatform.android) {
    localhost = '10.0.2.2';
  }
  return HomeApi(dio, baseUrl: 'http://$localhost:3000/api/v1');
}
