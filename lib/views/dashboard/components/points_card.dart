import 'package:flutter/material.dart';
import 'package:yukparkir/utils/components/constans.dart';

class PointsCard extends StatelessWidget {
  final int points;
  const PointsCard({Key? key, required this.points}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.all(Constans.padding * 2),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(10),
          color: ColorPallete.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 4))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: Constans.padding),
            child: Text(
              'Poin Anda',
              style: Theme.of(context).textTheme.headline3?.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: Constans.padding * 2),
            child: Text(
              '$points Poin',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ],
      ),
    );
  }
}
