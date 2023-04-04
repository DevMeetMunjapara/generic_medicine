import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CirculerProcess extends StatefulWidget {
  const CirculerProcess({super.key});

  @override
  State<CirculerProcess> createState() => _CirculerProcessState();
}

class _CirculerProcessState extends State<CirculerProcess> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
