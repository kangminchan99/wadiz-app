import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_network_provider.g.dart';

@riverpod
Dio dio(Ref ref) {
  var localhost = 'localhost';
  // Platform.isAnroid 보다 아래 방법이 권장 방식
  if (defaultTargetPlatform == TargetPlatform.android) {
    localhost = '10.0.2.2';
  }

  final options = BaseOptions(
    baseUrl: 'http://$localhost:3000/api/v1',
    responseType: ResponseType.json,
    headers: {"Content-Type": "application/json"},
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  );
  return Dio(options);
}
