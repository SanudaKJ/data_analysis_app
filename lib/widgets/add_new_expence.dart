import 'package:data_analysis_app/model/expence.dart';
import 'package:flutter/material.dart';
// import 'package:data_analysis_app/model/expence.dart';

class AddNewExpence extends StatefulWidget {
  final void Function(ExpenceModel expence) onAddExpence;
  const AddNewExpence({super.key, required this.onAddExpence});

  @override
  State<AddNewExpence> createState() => _AddNewExpenceState();
}

class _AddNewExpenceState extends State<AddNewExpence> {
  final _titleController =
      TextEditingController(); // controller is used to get the value of the text field
  final _amountController =
      TextEditingController(); // controller is used to get the value of the text field

  Catagory _selectCatagory = Catagory.food; // default catagory is food

  final DateTime initialDate = DateTime.now(); // initial date is today
  final DateTime firstDate = DateTime(
      DateTime.now().year - 5,
      DateTime.now().month,
      DateTime.now().day); // first date is 5 years before today
  final DateTime lastDate = DateTime(
      DateTime.now().year + 5,
      DateTime.now().month,
      DateTime.now().day); // last date is 5 years after today

  DateTime _selectedDate = DateTime.now(); // default date is today

  Future<void> _openDateModel() async {
    // open the date picker
    try {
      final pickedDate = await showDatePicker(
          // show the date picker
          context: context,
          initialDate: initialDate,
          firstDate: firstDate,
          lastDate: lastDate);
      setState(() {
        _selectedDate = pickedDate!;
      });
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  void _hadleFormSubmit() {
    // handle the form submit
    final userAmount = double.parse(_amountController.text.trim());

    if (_titleController.text.trim().isEmpty || userAmount <= 0) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Enter valid data'),
            content: const Text('Please enter valid title and amount'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    } else {
      ExpenceModel newExpence = ExpenceModel(
          title: _titleController.text.trim(),
          amount: userAmount,
          date: _selectedDate,
          catagory: _selectCatagory);

      widget.onAddExpence(newExpence);
      Navigator.pop(context);
    }
  }

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
              Expanded(
                child: TextField(
                  controller: _amountController,
                  decoration: const InputDecoration(
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
                  Text(formattedData.format(_selectedDate)),
                  IconButton(
                      onPressed: _openDateModel, // open the date picker
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
                onPressed: () {
                  Navigator.pop(
                      context); // pop is used to remove the widget from the widget tree(removes the widget from the screen)
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red)),
                child: const Text('Cancle'),
              ),
              const SizedBox(
                width: 50,
              ),
              ElevatedButton(
                onPressed: _hadleFormSubmit,
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green)),
                child: const Text('Save'),
              )
            ],
          )
        ],
      ),
    );
  }
}
