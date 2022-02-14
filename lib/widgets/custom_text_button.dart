import 'package:counter_firebase/services/firestore_services.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final FirestoreProvider provider;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: provider.resetCounters,
      child: const Text('Reset Counters'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color(0xFFCC004A),
        ),
        foregroundColor: MaterialStateProperty.all(
          Colors.white,
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 20),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        ),
      ),
    );
  }
}
