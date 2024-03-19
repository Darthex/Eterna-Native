import 'package:eterna_native/providers/api_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class ApiSelector extends ConsumerStatefulWidget {
  const ApiSelector({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ApiSelectorState();
  }
}

class _ApiSelectorState extends ConsumerState<ApiSelector> {
  final _titleController = TextEditingController();

  void _saveApi() {
    final enteredText = _titleController.text;
    if (enteredText.isEmpty) {
      return;
    }
    ref.read(apiProvider.notifier).addApi(enteredText);
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'API'),
                controller: _titleController,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              ElevatedButton(
                onPressed: _saveApi,
                child: const Text('Enter api'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
