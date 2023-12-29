import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_and_mvc_case/core/constants/dimensions.dart';
import 'package:riverpod_and_mvc_case/providers/user_provider.dart';
import 'package:riverpod_and_mvc_case/services/auth_service.dart';
import 'package:riverpod_and_mvc_case/widgets/user_card.dart';

class UsersPage extends ConsumerWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userApiProvider = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Users'),
        actions: [
          IconButton(
            onPressed: logout,
            icon: Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
          child: userApiProvider.when(
            data: (data) {
              if (data == null) {
                return Center(
                  child: Text("Error Occupied"),
                );
              }

              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return UserCard(user: data[index]);
                },
              );
            },
            error: (_, __) {
              return Center(
                child: Text("Error Occupied"),
              );
            },
            loading: () {
              return CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.black),
              );
            },
          ),
        ),
      ),
    );
  }

  void logout() {
    AuthService.instance.logout();
  }
}
