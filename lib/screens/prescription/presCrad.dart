import 'package:flutter/material.dart';

Widget pCard(date, id, name, quantity, timing) {
  return Container(
    height: 200,
    child: Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              date,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Prescription ID',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ':',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('$id'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Prescription Name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ':',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('$name'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Quantity',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ':',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('$quantity'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Timing',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ':',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('$timing'),
            ],
          ),
        ],
      ),
    ),
  );
}
