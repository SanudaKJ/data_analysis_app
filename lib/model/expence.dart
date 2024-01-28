import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final uuid =
    const Uuid().v4(); // uuid is used to generate unique id for each expence

final formattedData = DateFormat.yMd(); // date format (year/month/day)

enum Catagory {
  food,
  tarvel,
  leasure,
  work
} // enum for catagory (enum is a special type of class in dart)

 final CatagoryIcons = { // map for catagory icons    
  Catagory.food: Icons.lunch_dining,
  Catagory.leasure: Icons.sports_score,
  Catagory.tarvel: Icons.flight,
  Catagory.work: Icons.work,
};

class ExpenceModel {
  ExpenceModel({
    // constructor (constructor is  called when an object is created)
    required this.title,
    required this.amount,
    required this.date,
    required this.catagory,
  }) : id = uuid;

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Catagory catagory;

  String get getformatDate {
    // getter for date
    return formattedData.format(date);
  }
}
