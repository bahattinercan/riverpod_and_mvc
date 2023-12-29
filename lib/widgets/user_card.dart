import 'package:flutter/material.dart';
import 'package:riverpod_and_mvc_case/core/constants/dimensions.dart';
import 'package:riverpod_and_mvc_case/models/user_model.dart';

class UserCard extends StatefulWidget {
  final UserModel user;
  const UserCard({super.key, required this.user});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Row(
              children: [
                Image.network(
                  widget.user.avatar!,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: Dimensions.PADDING_SIZE_SMALL,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${widget.user.id} ${widget.user.firstName} ${widget.user.lastName}"),
                      Text("${widget.user.email}")
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
