import 'package:date_counter/src/action_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'my_colors.dart';

class DateWidget extends StatelessWidget {
  const DateWidget(
      {super.key,
      required this.date,
      required this.count,
      required this.onChange});
  final DateTime date;
  final int count;
  final ValueChanged<int> onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 110,
        height: 135,
        decoration: const BoxDecoration(
            color: gray, borderRadius: BorderRadius.all(Radius.circular(12))),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(DateFormat('MMM dd').format(date), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),

            Text(DateFormat('EEE').format(date).toUpperCase(), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
            Spacer(flex: 2),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color:count==0?shiftCountGrey: shiftCountGreen),
              child: Text('$count Shift',
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold)),
            ),
            Spacer(flex: 2),
            Row(
              children: [
                ActionButton(
                    onChange: () {
                      print("Decrease count $count");
                      int val = count ?? 0;
                      if(val!=0)
                      onChange(val - 1);
                    },
                    buttonText: "-"),
                const Spacer(),
                ActionButton(
                    onChange: () {
                      print("Increase count $count");
                      int val = count ?? 0;

                      onChange(val + 1);
                    },
                    buttonText: "+"),
              ],
            )
          ],
        ));
  }
}
