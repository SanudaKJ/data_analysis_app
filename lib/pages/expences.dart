import 'package:data_analysis_app/model/expence.dart';
import 'package:data_analysis_app/widgets/expence_list.dart';
import 'package:flutter/material.dart';

class Expences extends StatefulWidget {
  const Expences({super.key});

  @override
  State<Expences> createState() => _ExpencesState();
}

class _ExpencesState extends State<Expences> {
  //Expence List
  final List<ExpenceModel> _expenceList = [
    ExpenceModel(
        title: "Rugby",
        amount: 12.5,
        date: DateTime.now(),
        catagory: Catagory.leasure),
    ExpenceModel(
        title: "Presentation",
        amount: 15.8,
        date: DateTime.now(),
        catagory: Catagory.work),
    ExpenceModel(
        title: "Cricket",
        amount: 41.8,
        date: DateTime.now(),
        catagory: Catagory.leasure)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20, // Shadow of the AppBar (20 is default)
        title: const Text('Expences Master'),
        backgroundColor: Colors.green,
        actions: [
          Container(
            width: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.lightGreen,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          )
        ],
      ),
      body:  Column(
        children: [
          ExpenceList(expenceList: _expenceList ,),
        ],
      ),
    );
  }
}
