import '../models/base_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var model = BaseModel();

  @override
  void initState() {
    model.handleStartUpLogic();
    super.initState();
  }

  Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat")),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                model.welcomeMessage,
                style: TextStyle(fontSize: 20),
              ),
              RaisedButton(
                  onPressed: () {},
                  color: fromHex(model.buttonColor),
                  child: Text("Click me"))
            ],
          ),
        ),
      ),
    );
  }
}
