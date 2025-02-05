import 'package:flutter/material.dart';

class ChooseMenu extends StatelessWidget {
  final bool enable;
  final String title;
  final Function() action;

  const ChooseMenu({
    super.key,
    required this.enable,
    required this.title,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: action,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: enable ? Theme.of(context).primaryColor : (isDarkMode ? Colors.black : Colors.white),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          title,
          style: enable
              ? Theme.of(context).primaryTextTheme.titleMedium
              : Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
        ),
      ),
    );
  }
}
