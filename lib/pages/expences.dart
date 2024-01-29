import 'package:data_analysis_app/model/expence.dart';
import 'package:data_analysis_app/widgets/add_new_expence.dart';
import 'package:data_analysis_app/widgets/expence_list.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

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
        catagory: Catagory.food),
    ExpenceModel(
        title: "Presentation",
        amount: 15.8,
        date: DateTime.now(),
        catagory: Catagory.work),
    ExpenceModel(
        title: "Cricket",
        amount: 41.8,
        date: DateTime.now(),
        catagory: Catagory.tarvel)
  ];
  Map<String, double> dataMap = {
    "Food": 0,
    "Leasure": 0,
    "Travel": 0,
    "Work": 0,
  };

  void onAddExpence(ExpenceModel expence) {
    setState(() {
      _expenceList.add(expence);
      calCatagoryValues();
    });
  }

  void _openAddExpenceOverLay() {
    // function to open the bottom sheet (overlay)
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return AddNewExpence(
            onAddExpence: onAddExpence,
          ); // AddNewExpence is a widget
        });
  }

  void onDeleteExpence(ExpenceModel expence) {
    ExpenceModel deletingExpence = expence;
    final int removingIndex = _expenceList.indexOf(expence);
    setState(() {
      _expenceList.remove(expence);
      calCatagoryValues();
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Delete Successful"),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _expenceList.insert(removingIndex, deletingExpence);
              calCatagoryValues();
            });
          }),
    ));
  }

  //Catagory Values for Pie Chart
  double foodval = 0;
  double leasureval = 0;
  double travelval = 0;
  double workval = 0;

  void calCatagoryValues() {
    double foodvalTotal = 0;
    double leasurevalTotal = 0;
    double travelvalTotal = 0;
    double workvalTotal = 0;

    for (final expence in _expenceList) {
      if (expence.catagory == Catagory.food) {
        foodvalTotal += expence.amount;
      }
      if (expence.catagory == Catagory.leasure) {
        leasurevalTotal += expence.amount;
      }
      if (expence.catagory == Catagory.tarvel) {
        travelvalTotal += expence.amount;
      }
      if (expence.catagory == Catagory.work) {
        workvalTotal += expence.amount;
      }
    }
    setState(() {
      foodval = foodvalTotal;
      leasureval = leasurevalTotal;
      travelval = travelvalTotal;
      workval = workvalTotal;
    });

    dataMap = {
      "Food": foodval,
      "Leasure": leasureval,
      "Travel": travelval,
      "Work": workval,
    };
  }

  @override
  void initState() {
    super.initState();
    calCatagoryValues();
  }

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
              onPressed: _openAddExpenceOverLay,
              icon: const Icon(Icons.add),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          PieChart(dataMap: dataMap),
          ExpenceList(
            expenceList: _expenceList,
            onDeleteExpence: onDeleteExpence,
          ),
        ],
      ),
    );
  }
}
