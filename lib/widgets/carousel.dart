import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  const Carousel(this.images, this.index, this.onSet, this.onUnset, {super.key});

  final List images;
  final int index;
  final void Function() onSet;
  final void Function() onUnset;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
            images[index],
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
                  onTap: index < 1 ? null : onUnset,
                ),
              ),
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: index < images.length - 1 ? onSet : null,
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
            children: images
                .asMap()
                .entries
                .map(
                  (i) => Flexible(
                    flex: 1,
                    child: Container(
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: index == i.key ? Colors.white : Colors.white24,
                        border: Border.all(color: Colors.black, width: double.minPositive),
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
