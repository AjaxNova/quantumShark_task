import 'package:flutter/material.dart';
import 'package:quantum_sharks/constants/colors.dart';

class SlotWidget extends StatelessWidget {
  final String time;
  final bool isSelectedSlot;
  final VoidCallback onTap;
  final bool isOnline;

  const SlotWidget(
      {super.key,
      required this.time,
      this.isSelectedSlot = false,
      required this.onTap,
      this.isOnline = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: isSelectedSlot
                ? appBarBackgroundColor
                : isOnline
                    ? Colors.white
                    : null,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(width: .3)),
        width: 90,
        height: 32,
        child: Center(
            child: Text(
          time,
          style: TextStyle(
              fontSize: 12, color: isSelectedSlot ? Colors.white : null),
        )),
      ),
    );
  }
}
