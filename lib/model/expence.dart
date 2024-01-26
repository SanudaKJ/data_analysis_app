import 'package:uuid/uuid.dart';

final uuid =
    const Uuid().v4(); // uuid is used to generate unique id for each expence

enum Catagory {
  food,
  tarvel,
  leasure,
  work
} // enum for catagory (enum is a special type of class in dart)

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
}
