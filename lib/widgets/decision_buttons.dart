import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/data_provider.dart';

class DecisionButtons extends ConsumerWidget {
  const DecisionButtons(this.onDecide, this.snapshot, {super.key});

  final void Function() onDecide;
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(dataProvider);
    final isLoading = snapshot.connectionState == ConnectionState.waiting && data.isEmpty;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.redAccent)),
                child: IconButton(
                  onPressed: isLoading ? null : onDecide,
                  icon: const Icon(Icons.close),
                  color: Colors.redAccent,
                  iconSize: 40,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.greenAccent)),
                child: IconButton(
                  onPressed: isLoading ? null : onDecide,
                  icon: const Icon(Icons.check),
                  color: Colors.greenAccent,
                  iconSize: 40,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
