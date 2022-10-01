import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ThemeSwitch extends StatefulWidget {
   ThemeSwitch({
    Key? key,
    required this.wifi,
  }) : super(key: key);

   bool wifi = false;

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoTheme.of(context).barBackgroundColor,
      child: CupertinoFormRow(
        prefix: Row(
          children: [
            Icon(
              // Wifi icon is updated based on switch value.
              widget.wifi ? CupertinoIcons.moon : CupertinoIcons.sun_max,
              color: widget.wifi
                  ? CupertinoColors.systemBlue
                  : CupertinoColors.systemRed,
            ),
            const SizedBox(width: 10),
            const Text('Wi-Fi')
          ],
        ),
        child: CupertinoSwitch(
          value: widget.wifi,
          thumbColor: CupertinoColors.white,
          trackColor: CupertinoColors.systemGrey5,
          activeColor: CupertinoColors.activeGreen,
          onChanged: (bool? value) {
            setState(() {
              widget.wifi = value!;
            });
          },
        ),
      ),
    );
  }
}
