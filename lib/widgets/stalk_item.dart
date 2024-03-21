import 'package:eterna_native/providers/data_provider.dart';
import 'package:eterna_native/screens/stalk_details.dart';
import 'package:eterna_native/widgets/carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StalkItem extends ConsumerStatefulWidget {
  const StalkItem(this.ikey, {super.key});

  final int ikey;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _StalkItemState();
  }
}

class _StalkItemState extends ConsumerState<StalkItem> {
  int index = 0;

  void _setIndex() {
    setState(() {
      index += 1;
    });
  }

  void _unsetIndex() {
    setState(() {
      index -= 1;
    });
  }

  void _getDetails() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            StalkDetails(widget.ikey, index, _setIndex, _unsetIndex),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(dataProvider);
    final item = data[widget.ikey];

    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Hero(
            tag: widget.ikey,
            child: Carousel(item['imageList'], index, _setIndex, _unsetIndex),
          ),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  item['full_name'],
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(width: 5),
                Text(
                  item['age'].toString(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Spacer(),
                IconButton(
                  onPressed: _getDetails,
                  icon: const Icon(Icons.info_outline),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
