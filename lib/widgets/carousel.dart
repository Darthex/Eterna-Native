import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel(this.images, {super.key});

  final List images;

  @override
  State<StatefulWidget> createState() {
    return _CarouselState();
  }
}

class _CarouselState extends State<Carousel> {
  var _index = 0;

  void _setIndex() {
    setState(() {
      _index += 1;
    });
  }

  void _unsetIndex() {
    setState(() {
      _index -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
            widget.images[_index],
            // snapshot.data['images'],
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: _index < 1 ? null : _unsetIndex,
                ),
              ),
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: _index < widget.images.length - 1 ? _setIndex : null,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 10,
          right: 10,
          top: 10,
          child: Row(
            children: widget.images
                .asMap()
                .entries
                .map(
                  (i) => Flexible(
                    flex: 1,
                    child: Container(
                      height: 10,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: _index == i.key ? Colors.white : Colors.white24,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
