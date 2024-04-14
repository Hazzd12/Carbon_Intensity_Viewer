import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget CustomizedText(String txt,
    {double font_size = 24.0, //Named Parameters
      Color font_color = Colors.white,
      FontWeight font_Weight = FontWeight.bold}) {
  return Text(txt,
      softWrap: true,
      style: TextStyle(
        fontSize: font_size,
        color: font_color,
        fontWeight: font_Weight,
      ));
}

Widget mySpace(double height) {
  return SizedBox(height: height);
}

Widget myButton(
    String txt,
    BuildContext context,
    String routeName,
    {double width = 200.0,
      IconData icon = Icons.abc,
    }
    ){
  return
    SizedBox(
    width: width, // 设置按钮宽度与屏幕宽度一致
    child: ElevatedButton(
      onPressed: (){
        Navigator.pushNamed(context, routeName);
      },
      child: Row(
        //mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 30),
          SizedBox(width: 15),
          CustomizedText(txt, font_color: Colors.black),
        ],
      ),
    ),
  );
}


class DatePickerFormField extends StatelessWidget {
  final String label;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  DatePickerFormField({
    required this.label,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('yyyy-MM-dd');

    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: Icon(Icons.calendar_today),
      ),
      readOnly: true, // Prevents keyboard from appearing when tapping the field
      controller: TextEditingController(
        text: selectedDate == null ? '' : dateFormat.format(selectedDate),
      ),
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (picked != null && onDateSelected != null) {
          onDateSelected(picked);
        }
      },
    );
  }
}