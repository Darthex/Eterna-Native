import 'package:eterna_native/dev/api_selector.dart';
import 'package:eterna_native/providers/api_provider.dart';
import 'package:eterna_native/screens/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Entry extends ConsumerWidget {
  const Entry({ super.key });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final api = ref.watch(apiProvider);
    return api.isEmpty ? const ApiSelector() : const Tabs();
  }
}
