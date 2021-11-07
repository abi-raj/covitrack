import 'package:covitrack/utils/APIcalls.dart';
import 'package:flutter/material.dart';

import '../../utils/colorConst.dart';

class SosButton extends StatefulWidget {
  const SosButton();
  @override
  _SosButtonState createState() => _SosButtonState();
}

class _SosButtonState extends State<SosButton> with TickerProviderStateMixin {
  late AnimationController _controller;
  bool change = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.5,
      duration: Duration(seconds: 3),
    )..repeat();
    //if shaked automatic turn on
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //route model args
    return change
        ? AnimatedBuilder(
            animation: CurvedAnimation(
                parent: _controller, curve: Curves.fastOutSlowIn),
            builder: (context, child) {
              return Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  _buildContainer(150 * _controller.value),
                  _buildContainer(200 * _controller.value),
                  _buildContainer(250 * _controller.value),
                  _buildContainer(300 * _controller.value),
                  Align(
                      child: IconButton(
                    icon: Icon(Icons.phone_android),
                    onPressed: () {
                      setState(() {
                        change = false;
                      });
                    },
                  )),
                ],
              );
            },
          )
        : _button();
  }

  Widget _buildContainer(double radius) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: emergencyColor.withOpacity(1 - _controller.value),
      ),
    );
  }

  Widget _button() {
    return Center(
      child: Container(
        height: 200,
        child: MaterialButton(
          color: emergencyColor,
          child: Center(
              child: Text(
            'HELP ME !',
            style: TextStyle(color: Colors.white, fontSize: 24),
          )),
          onPressed: () {
            sendEmergency();
          },
          shape: CircleBorder(),
        ),
      ),
    );
  }

  void sendEmergency() {
    setState(() {
      change = true;
    });
    APITasks().addEmergency('a@g.com');
  }
}

const Text headText = Text('Are You in Emergency?', style: sosTextStyle);

const TextStyle sosTextStyle = TextStyle(
  color: authColor,
  fontWeight: FontWeight.w800,
  fontSize: 27,
);

const Text h2text =
    Text('Press the button below and help \nwill reach you soon.',
        style: TextStyle(
          color: authColor,
          fontSize: 17,
          fontWeight: FontWeight.w300,
        ));

Padding topText = Padding(
    padding: const EdgeInsets.all(10),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headText,
          SizedBox(
            height: 15,
          ),
          h2text,
        ],
      ),
    ));
