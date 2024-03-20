import 'package:eterna_native/widgets/carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/data_provider.dart';

class StalkDetails extends ConsumerStatefulWidget {
  const StalkDetails(this.ikey, this.index, this.onSet, this.onUnset,
      {super.key});

  final int ikey;
  final int index;
  final void Function() onSet;
  final void Function() onUnset;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _StalkDetailsState();
  }
}

class _StalkDetailsState extends ConsumerState<StalkDetails> {
  late int localIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    localIndex = widget.index;
  }

  void localOnSet() {
    setState(() {
      localIndex += 1;
    });
    widget.onSet();
  }

  void localOnUnset() {
    setState(() {
      localIndex -= 1;
    });
    widget.onUnset();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(dataProvider);
    final item = data[widget.ikey];

    return Scaffold(
      appBar: AppBar(
        title: Text(item['display_name']),
      ),
      body: ListView(
        // child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 500,
              child: Hero(
                tag: widget.ikey,
                child: Carousel(
                    item['imageList'], localIndex, localOnSet, localOnUnset),
              ),
            ),
            const Center(
              child: Text('Details coming soon'),
            ),
          ],
        // ),
      ),
    );
  }
}
