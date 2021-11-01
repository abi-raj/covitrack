import 'package:flutter/material.dart';
import 'sosWidgets.dart';

class SOSscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //for auto shake emergency
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: mediaQuery.height * 0.15),
          Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0), child: topText),
          Container(height: mediaQuery.height * 0.53, child: SosButton()),
        ],
      ),
    );
  }
}
