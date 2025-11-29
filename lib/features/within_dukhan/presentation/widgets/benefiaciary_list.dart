import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class BeneficiaryList extends StatelessWidget {
  final List display;
  final double iconSize;

  const BeneficiaryList({
    super.key,
    required this.display,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    final firstAliyaIndex = display.indexWhere(
      (b) => b.name.trim().toLowerCase() == 'aliya khan',
    );

    return ListView.separated(
      padding: const EdgeInsets.only(top: 8),
      itemCount: display.length,
      separatorBuilder: (_, __) =>
          Divider(height: 1, color: DefaultColors.grayE6),
      itemBuilder: (_, i) {
        final item = display[i];
        final name = item.name.trim();
        final lower = name.toLowerCase();

        final isAliya = lower == 'aliya khan';
        final isFirstAliya = isAliya && i == firstAliyaIndex;
        final isSecondAliya = isAliya && i != firstAliyaIndex;

        Widget leading;

        if (isFirstAliya) {
          leading = CircleAvatar(
            radius: h * 0.03,
            backgroundColor: DefaultColors.grayE6,
            child: Text(
              "AK",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: DefaultColors.gray7D,
                fontSize: w * 0.038,
              ),
            ),
          );
        } else if (isSecondAliya) {
          leading = CircleAvatar(
            radius: h * 0.03,
            backgroundColor: DefaultColors.grayE6,
            backgroundImage: const AssetImage('assets/images/sara.png'),
          );
        } else {
          final parts = name.split(" ");
          String init = "";
          if (parts.length == 1) {
            init = parts[0][0];
          } else {
            init = parts[0][0] + parts[1][0];
          }
          init = init.toUpperCase();

          leading = CircleAvatar(
            radius: h * 0.03,
            backgroundColor: DefaultColors.grayE6,
            // child: Icon(
            //   Icons.person,
            //   color: DefaultColors.black51,
            //   size: iconSize,
            // ),
          );

          if (init == 'SR' || init == 'YN') {
            leading = CircleAvatar(
              radius: h * 0.03,
              backgroundColor: DefaultColors.blueFA,
              child: Text(
                init,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: DefaultColors.blue9D,
                  fontSize: w * 0.038,
                ),
              ),
            );
          }
        }

        final titleStyle = TextStyle(
          fontWeight: isSecondAliya ? FontWeight.w600 : FontWeight.w600,
          fontSize: w * 0.04,
          color: isFirstAliya ? DefaultColors.gray7D : DefaultColors.black,
        );

        final subtitleStyle = TextStyle(
          fontSize: w * 0.032,
          color: DefaultColors.gray82,
        );

        final trailing = isFirstAliya
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Active in',
                    style: TextStyle(
                      fontSize: w * 0.03,
                      color: DefaultColors.gray82,
                    ),
                  ),
                  SizedBox(height: h * 0.005),
                  Text(
                    '1h 55m',
                    style: TextStyle(
                      fontSize: w * 0.033,
                      color: DefaultColors.gray7D,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            : null;

        return ListTile(
          leading: leading,
          title: Text(item.name, style: titleStyle),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: h * 0.006),
              Text("XXXX1827", style: subtitleStyle),
              SizedBox(height: h * 0.006),
              Text(item.sub, style: subtitleStyle),
            ],
          ),
          trailing: trailing,
          onTap: () => Navigator.pop(context, item),
        );
      },
    );
  }
}
