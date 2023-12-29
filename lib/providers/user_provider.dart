import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:riverpod_and_mvc_case/services/user_service.dart';

final userProvider = FutureProvider.autoDispose((_) {
  final service = UserService.instance;
  return service.getUsers();
});
