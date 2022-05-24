import 'package:flutter/material.dart';

class ViewPropertyOnMap extends StatefulWidget {
  const ViewPropertyOnMap({Key? key}) : super(key: key);

  @override
  State<ViewPropertyOnMap> createState() => _ViewPropertyOnMapState();
}

class _ViewPropertyOnMapState extends State<ViewPropertyOnMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
        centerTitle: true,
      ),
    );
  }
}
