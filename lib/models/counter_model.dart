import 'package:cloud_firestore/cloud_firestore.dart';

class CounterModel {
  final int counter1;
  final int counter2;
  final int counter3;
  CounterModel({
    required this.counter1,
    required this.counter2,
    required this.counter3,
  });

  factory CounterModel.fromJson(DocumentSnapshot json) {
    final int counter1 = json['counter1'] as int;
    final int counter2 = json['counter2'] as int;
    final int counter3 = json['counter3'] as int;
    return CounterModel(
      counter1: counter1,
      counter2: counter2,
      counter3: counter3,
    );
  }

  static toJson({required int c1, required int c2, required int c3}) {
    return {
      'counter1': c1,
      'counter2': c2,
      'counter3': c3,
    };
  }
}
