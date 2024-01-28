import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:data_analysis_app/model/expence.dart';

class AddNewExpence extends StatefulWidget {
  const AddNewExpence({super.key});

  @override
  State<AddNewExpence> createState() => _AddNewExpenceState();
}

class _AddNewExpenceState extends State<AddNewExpence> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  Catagory _selectCatagory = Catagory.food; // default catagory is food

  @override
  void dispose() {
    // dispose is called when the widget is removed from the widget tree (when the widget is removed from the screen) to free up the space

    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller:
                _titleController, // controller is used to get the value of the text field
            decoration: const InputDecoration(
              hintText: 'Enter Expence Title',
              label: Text('Title'),
            ),
            keyboardType: TextInputType.text,
            maxLength: 50,
          ),
          Row(
            children: [
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Amount',
                    label: Text('Amount'),
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 50,
                ),
              ),
              Expanded(
                  // expanded is used to expand the widget to the available space
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end, //date picker
                children: [
                  const Text('2024/01/28'),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.date_range_outlined))
                ],
              ))
            ],
          ),
          Row(
            children: [
              DropdownButton(
                value: _selectCatagory,
                items: Catagory.values
                    .map(
                      //add the catagory values to the dropdown menu
                      (catagory) => DropdownMenuItem(
                        value: catagory,
                        child: Text(catagory.name),
                      ),
                    )
                    .toList(),
                onChanged: (value) => {
                  setState(() {
                    // setState is used to update the UI (change the UI)
                    _selectCatagory = value!;
                  }),
                },
              )
            ],
          ),
          Row(
            // row for the buttons (save and cancle)
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red)),
                child: const Text('Cancle'),
              ),
              const SizedBox(
                width: 50,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.green[700])),
                child: const Text('Save'),
              )
            ],
          )
        ],
      ),
    );
  }
}
