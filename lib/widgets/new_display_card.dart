import 'package:eterna_native/widgets/decision_buttons.dart';
import 'package:eterna_native/widgets/stalk_item.dart';
import 'package:flutter/material.dart';

class NewDisplayCard extends StatefulWidget {
  const NewDisplayCard(this.api, this.snapshot, this.ikey, this.onClick, {super.key});

  final String api;
  final AsyncSnapshot snapshot;
  final int ikey;
  final void Function() onClick;

  @override
  State<NewDisplayCard> createState() => _DisplayCardState();
}

class _DisplayCardState extends State<NewDisplayCard> {
  void _decide() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Durations.extralong3,
        elevation: 6,
        behavior: SnackBarBehavior.floating,
        content: Text('No Animations yet'),
      ),
    );
    widget.onClick();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 20,
      child: Column(
        children: [
          Flexible(
            flex: 6,
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: StalkItem(widget.snapshot, widget.ikey),
            ),
          ),
          Flexible(
            flex: 1,
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: DecisionButtons(_decide, widget.snapshot),
            ),
          ),
        ],
      ),
    );
  }
}
