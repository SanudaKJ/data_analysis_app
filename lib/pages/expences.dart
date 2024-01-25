import 'package:flutter/material.dart';

class Expences extends StatefulWidget {
  const Expences({super.key});

  @override
  State<Expences> createState() => _ExpencesState();
}

class _ExpencesState extends State<Expences> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20, // Shadow of the AppBar (20 is default)
        title: const Text('Expences Master'),
        backgroundColor: Colors.green,
        actions: [
          Container(
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
    );
  }
}
