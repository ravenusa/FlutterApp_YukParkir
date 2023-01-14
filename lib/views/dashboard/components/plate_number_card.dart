import 'package:flutter/material.dart';
import 'package:yukparkir/utils/components/constans.dart';

class PlateNumberCard extends StatelessWidget {
  final String plateNumber;
  const PlateNumberCard({Key? key, required this.plateNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Constans.padding / 2),
      margin: const EdgeInsets.symmetric(
          horizontal: Constans.padding * 2, vertical: Constans.padding),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(10)),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          plateNumber,
          style: const TextStyle(
              wordSpacing: 10,
              letterSpacing: 4,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
