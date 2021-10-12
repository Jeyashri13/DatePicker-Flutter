import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1990, 1),
                  lastDate: DateTime(2040, 12),
                ).then((selectedDate) {
                  if (selectedDate != null) {
                    _controller.text = selectedDate.toString();
                    _controller.text =
                        DateFormat('dd-MM-yyyy').format(selectedDate);
                  }
                });
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.calendar_today,
                  color: Colors.blueAccent,
                ),
                labelText: 'Date to Disposal',
                hintStyle: TextStyle(color: Color(0xff898787)),
                filled: true,
                fillColor: Color(0xffD9EDFE),
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
              controller: _controller,
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     showDatePicker(
            //       context: context,
            //       initialDate: DateTime.now(),
            //       firstDate: DateTime(1990, 1),
            //       lastDate: DateTime(2040, 12),
            //     ).then((selectedDate) {
            //       if (selectedDate != null) {
            //         _controller.text = selectedDate.toString();
            //         _controller.text =
            //             DateFormat('dd-MM-yyyy').format(selectedDate);
            //       }
            //     });
            //   },
            //   child: const Text("Date to Disposal"),
            // )
          ],
        ),
      ),
    );
  }
}
