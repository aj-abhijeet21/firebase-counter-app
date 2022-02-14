import 'package:counter_firebase/services/firestore_services.dart';
import 'package:counter_firebase/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter3 extends StatefulWidget {
  const Counter3({Key? key}) : super(key: key);

  @override
  _Counter3State createState() => _Counter3State();
}

class _Counter3State extends State<Counter3> {
  @override
  Widget build(BuildContext context) {
    FirestoreProvider provider =
        Provider.of<FirestoreProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: const Color(0xFF020202),
      appBar: AppBar(
        title: const Text(
          'Counter 3',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              '${provider.counter3}',
              style: const TextStyle(
                color: Color(0xFFCC004A),
                fontWeight: FontWeight.bold,
                fontSize: 60,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextButton(provider: provider),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: provider.incrementCounter3,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
