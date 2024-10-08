import 'package:flutter/material.dart';

import '../../../../global/icons/custom_icons.dart';
import 'circle_button.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            _QuickButton(
              label: 'Gallery',
              color: Color(0xff92BE87),
              iconData: CustomIcons.photos,
            ),
            SizedBox(width: 15),
            _QuickButton(
              label: 'Tag Friends',
              color: Color(0xff2880D4),
              iconData: CustomIcons.user_friends,
            ),
            SizedBox(width: 15),
            _QuickButton(
              label: 'Live',
              color: Color(0xffFB7171),
              iconData: CustomIcons.video_camera,
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickButton extends StatelessWidget {
  const _QuickButton({
    Key? key,
    required this.label,
    required this.iconData,
    required this.color,
  }) : super(key: key);

  final IconData iconData;
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: 25,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleButton(
            color: color.withOpacity(0.6),
            iconData: iconData,
          ),
          const SizedBox(width: 15),
          Text(
            label,
            style: TextStyle(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
