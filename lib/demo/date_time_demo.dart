import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class DataTimeDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _DataTimeDemoState();
  }
}

class _DataTimeDemoState extends State<DataTimeDemo>{
  DateTime SelectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  Future<void> _selectDate()async{
    //弹出日期选择框
    final DateTime date = await showDatePicker(context: context, initialDate: SelectedDate, firstDate: DateTime(1900), lastDate: DateTime(2100));
  if(date == null)
    return;
  else{
    setState(() {
      SelectedDate = date;
    });
  }
  }
  _selectTime()async{
    final TimeOfDay time = await showTimePicker(context: context, initialTime: selectedTime);
    if(time == null)
      return;
    else{
      setState(() {
        selectedTime = time;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SnackBarDemo'),

      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Container(
              child:
                InkWell(
                  onTap: _selectDate,
                  child: Row(
                    children: <Widget>[
                      //格式转换为年月日
                      Text(DateFormat.yMd().format(SelectedDate)),
                      Icon(Icons.map)
                    ],
                  ),
                )
            ),
            Container(
                child:
                InkWell(
                  onTap: _selectTime,
                  child: Row(
                    children: <Widget>[
                      //格式转换为年月日
                      Text(selectedTime.format(context)),
                      Icon(Icons.map)
                    ],
                  ),
                )
            ),
          ],
        ),

      ),
    );
  }
}