import 'package:flutter/material.dart';

class TabbarWidget extends StatelessWidget {
  const TabbarWidget({
    super.key,
    required this.onTap,
    required this.selected,
    required this.title,
    required this.index,
  });

  final VoidCallback onTap;
  final int selected;
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,

          spacing: 10,
          children: [
            Text(title),
            Container(
              height: 2,
              width: MediaQuery.sizeOf(context).width,
              color: selected == index
                  ? Color(0xffFF4748)
                  : Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }
}
