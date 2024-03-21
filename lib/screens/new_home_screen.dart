import 'dart:convert';
import 'package:eterna_native/providers/data_provider.dart';
import 'package:eterna_native/widgets/new_display_card.dart';
import 'package:http/http.dart' as http;
import 'package:eterna_native/providers/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewHomeScreen extends ConsumerStatefulWidget {
  const NewHomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _NewHomeScreenState();
  }
}

class _NewHomeScreenState extends ConsumerState<NewHomeScreen> {
  late Future _stalkProfileFuture;

  @override
  void initState() {
    super.initState();
    final data = ref.read(dataProvider);
    if (data.isEmpty) {
      _stalkProfileFuture = _stalk();
    } else {
      _stalkProfileFuture = Future.value(data);
    }
  }

  _stalk() async {
    final api = ref.read(apiProvider);
    final url = Uri.parse('$api/stalk');
    final response = await http.get(url);
    final data = json.decode(response.body);
    ref.read(dataProvider.notifier).appendList(data);
    return data;
  }

  void _swiped() {
    ref.read(dataProvider.notifier).removeList();
    final count = ref.watch(dataProvider).length;
    if (count == 3) {
      setState(() {
        _stalkProfileFuture = _stalk();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final api = ref.watch(apiProvider);
    final data = ref.watch(dataProvider);

    return FutureBuilder(
      future: _stalkProfileFuture,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting &&
            data.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return Stack(
            children: data.asMap().entries.map((i) {
          return Dismissible(
            onDismissed: (d) {
              return _swiped();
            },
            background: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green.withOpacity(0.1),
              ),
              margin: const EdgeInsets.all(8),
              clipBehavior: Clip.hardEdge,
            ),
            secondaryBackground: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red.withOpacity(0.1),
              ),
              margin: const EdgeInsets.all(8),
              clipBehavior: Clip.hardEdge,
            ),
            key: ValueKey(i),
            child: Center(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: NewDisplayCard(api, snapshot, i.key, _swiped),
              ),
            ),
          );
        }).toList());
      },
    );
  }
}
