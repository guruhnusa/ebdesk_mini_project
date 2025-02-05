import 'package:flutter/material.dart';

class IndicatorHome extends StatelessWidget {
  const IndicatorHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              color: index != 2
                  ? (Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xff333333)
                      : const Color(0xFFD9D9D9))
                  : (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
              shape: BoxShape.circle,
            ),
          );
        },
      ),
    );
  }
}
