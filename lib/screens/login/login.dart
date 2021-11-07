import 'package:covitrack/utils/APIcalls.dart';
import 'package:covitrack/utils/colorConst.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController numberController;
  bool onTapped = false;
  @override
  void initState() {
    emailController = new TextEditingController();
    numberController = new TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: centerCard()));
  }

  Widget centerCard() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 10,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Wrap(
              runSpacing: 10.0,
              children: [
                centerText(),
                textField(emailController, TextInputType.name, 'Your Email'),
                textField(numberController, TextInputType.number, 'Your Phone'),
                onTapped ? Center(child: CircularProgressIndicator()) : button()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textField(controller, type, hint) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        maxLength: type == TextInputType.number ? 10 : null,
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          hintText: hint,
        ),
      ),
    );
  }

  Widget button() {
    return Center(
      child: SizedBox(
        width: 150,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
          onPressed: () async {
            if (emailController.text.length != 0 &&
                numberController.text.length != 0) {
              setState(() {
                onTapped = true;
              });
              final bool res = await APITasks()
                  .checkLogin(emailController.text, numberController.text);
              setState(() {
                onTapped = false;
              });

              if (res) {
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Text("Invalid Email/Mobile"),
                ));
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content: Text("Please Enter Valid values"),
              ));
            }
          },
          child: Text(
            'GO',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget centerText() {
    return Center(
      child: Text(
        'PATIENT LOGIN',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
