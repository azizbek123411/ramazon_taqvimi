import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ramazon_taqvimi/src/repository/providers/times_provider.dart';
import 'package:ramazon_taqvimi/src/repository/service/api_service.dart';

class NewPage extends StatefulHookConsumerWidget {
  const NewPage({super.key});

  @override
  ConsumerState<NewPage> createState() => _NewPageState();
}

class _NewPageState extends ConsumerState<NewPage> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(namozTimes);
    return Scaffold(
      body: provider.when(
        data: (data) {
          return Center(
            child: Text(data.times.hufton),
          );
        },
        error: (error, st) {
          log(error.toString());
          return Center(
            child: Text(
              error.toString(),
            ),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
