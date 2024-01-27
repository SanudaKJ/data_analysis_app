import 'package:data_analysis_app/model/expence.dart';
import 'package:flutter/material.dart';

class ExpenceTile extends StatelessWidget {
  const ExpenceTile({super.key, required this.expence});

  final ExpenceModel expence;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 136, 184, 151),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            expence.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(expence.amount.toStringAsFixed(2)),
              const Spacer(),
              Row(
                children: [
                  Icon(CatagoryIcons[expence.catagory]),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(expence.getformatDate)
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}
