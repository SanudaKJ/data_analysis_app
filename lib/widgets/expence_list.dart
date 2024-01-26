import 'package:data_analysis_app/model/expence.dart';
import 'package:data_analysis_app/widgets/expence_tile.dart';
import 'package:flutter/material.dart';

class ExpenceList extends StatelessWidget {
  const ExpenceList({super.key, required this.expenceList});

  final List<ExpenceModel> expenceList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: expenceList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: ExpenceTile(
                expence: expenceList[index],
              ),
            );
          }),
    );
  }
}
