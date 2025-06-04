import 'package:flutter/material.dart';
import 'package:projet_syn/item/itemMap.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Screen'),
      ),
      body: Center(
        child: MapScreenWidget()
      ),
    );
  }
}