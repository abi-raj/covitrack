import 'package:flutter/material.dart';

Widget card(icon, title, onPressed) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      margin: EdgeInsets.all(4),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.indigo,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
  );
}
