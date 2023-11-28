library date_counter;

import 'package:date_counter/src/date_widget.dart';
import 'package:date_counter/src/dynamic_padding.dart';
import 'package:date_counter/src/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateCounter extends StatefulWidget {
  const DateCounter({super.key, required this.count, required this.startingDate, required this.onchange, this.value});
  final int count;
  final DateTime startingDate;
  final Map<String,int>? value;
  final ValueChanged<Map<String,int>> onchange;

  @override
  State<DateCounter> createState() => _DateCounterState();
}

class _DateCounterState extends State<DateCounter> {
  Map<String,int> _list ={};

  @override
  void initState() {
if(widget.value!=null) {
  _list=widget.value!;
}
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(calculatePadding(size.width)),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: Colors.white),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
          child: Row(
            children: [
              Text("Select Dates",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textBlue)),
              Spacer(),
              Text("${_list.length} Date(s) Added",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: textblue)),
            ],
          ),
        ),
        // StaggeredGrid.count(crossAxisCount: 2),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          runAlignment: WrapAlignment.start,
          spacing: 5,
          runSpacing: 5,
          alignment: WrapAlignment.start,
          children: List.generate(widget.count, (index) => DateWidget(
            onChange: (value) {
              print("fesdvdgfewsdv $value");
              setState(() {
                if(value==0){
                  _list.remove(DateFormat('dd-MM-yyyy').format(widget.startingDate.add(Duration(days: index))));
                }else{
                  _list[DateFormat('dd-MM-yyyy').format(widget.startingDate.add(Duration(days: index)))]=value;
                }
                widget.onchange(_list);
              });
            },
            date: widget.startingDate.add(Duration(days: index)), count: _list[DateFormat('dd-MM-yyyy').format(widget.startingDate.add(Duration(days: index)))]??0,)),
        )
      ]),
    );
  }
}
