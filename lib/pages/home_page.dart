// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_and_mvc_case/models/quote_model.dart';
// import 'package:riverpod_and_mvc_case/providers/quote_provider.dart';

// class HomePage extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Deneme'),
//       ),
//       body: Center(
//         child: _Quote(),
//       ),
//     );
//   }
// }

// class _Quote extends ConsumerWidget {
//   const _Quote();

//   @override
//   Widget build(BuildContext context, widgetRef) {
//     final quoteApiProvider = widgetRef.watch(quoteProvider);

//     return quoteApiProvider.when(
//       data: (data) {
//         return ListView.builder(
//           itemCount: data.quotes?.length,
//           itemBuilder: (context, index) {
//             BaseQuoteModel? quote = data.quotes?[index];

//             return Container(
//               child: Text("${quote?.text}"),
//             );
//           },
//         );
//       },
//       error: (obj, stackTrace) {
//         print(stackTrace);
//         return ErrorPage();
//       },
//       loading: () {
//         return CircularProgressIndicator(
//           valueColor: AlwaysStoppedAnimation(Colors.black),
//         );
//       },
//     );
//   }
// }

// class ErrorPage extends StatelessWidget {
//   const ErrorPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text("Error occured"),
//     );
//   }
// }
