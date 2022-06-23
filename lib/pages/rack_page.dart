import 'package:flutter/material.dart';

class RackPage extends StatefulWidget {
  const RackPage({Key? key}) : super(key: key);

  @override
  State<RackPage> createState() => _RackPageState();
}

class _RackPageState extends State<RackPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Center(
        child: Text(
          'Rack',
          style: TextStyle(fontSize: 35),
        ),
      ),
    );
  }
}
