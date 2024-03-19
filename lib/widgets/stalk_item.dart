import 'dart:math';
import 'package:eterna_native/providers/data_provider.dart';
import 'package:eterna_native/widgets/carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StalkItem extends ConsumerWidget {
  const StalkItem(this.snapshot, this.ikey, {super.key});

  final AsyncSnapshot snapshot;
  final int ikey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(dataProvider);
    final isLoading = snapshot.connectionState == ConnectionState.waiting && data.isEmpty;
    final item = data[ikey];

    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : Carousel(item['imageList']),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 20,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                !isLoading
                    ? Text(
                        item['full_name'],
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    : const Text(''),
                const SizedBox(width: 5),
                !isLoading
                    ? Text(
                        item['age'].toString(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    : const Text(''),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
