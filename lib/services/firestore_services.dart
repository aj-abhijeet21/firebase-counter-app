import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counter_firebase/firebase_options.dart';
import 'package:counter_firebase/models/counter_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class FirestoreProvider extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference counters =
      FirebaseFirestore.instance.collection('counters');
  int counter1 = 0;
  int counter2 = 0;
  int counter3 = 0;

  void resetCounters() async {
    counter1 = 0;
    counter2 = 0;
    counter3 = 0;
    notifyListeners();
    await counters
        .doc('a6ETn4Lji3HieyEBARQQ')
        .update(
          CounterModel.toJson(c1: 0, c2: 0, c3: 0),
        )
        .then(
          (value) => print('Counters reset successfully...'),
        )
        .catchError(
          (e) => print(
            e.toString(),
          ),
        );
  }

  void updateCounters() async {
    await counters
        .doc('a6ETn4Lji3HieyEBARQQ')
        .update(
          CounterModel.toJson(c1: counter1, c2: counter2, c3: counter3),
        )
        .then(
          (value) => print('Counters updated...'),
        )
        .catchError(
          (e) => print(
            e.toString(),
          ),
        );
  }

  void getCounters() async {
    var data = await counters.doc('a6ETn4Lji3HieyEBARQQ').get();

    CounterModel model = CounterModel.fromJson(data);
    counter1 = model.counter1;
    counter2 = model.counter2;
    counter3 = model.counter3;
    notifyListeners();
  }

  void incrementCounter1() {
    counter1 += 1;
    notifyListeners();
    updateCounters();
  }

  void incrementCounter2() {
    counter2 += 1;
    notifyListeners();
    updateCounters();
  }

  void incrementCounter3() {
    counter3 += 1;
    notifyListeners();
    updateCounters();
  }
}
