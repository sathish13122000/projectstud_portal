import 'package:flutter/material.dart';
import 'package:stud_portal/components/messagecomposer.dart';

class private_chat extends StatefulWidget {
  // const private_chat({Key? key}) : super(key: key);

  final String title;
  private_chat(this.title);

  @override
  _private_chatState createState() => _private_chatState();
}

class _private_chatState extends State<private_chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:
            Text("This is the start of you conversation with " + widget.title),
      ),
      bottomNavigationBar: MessageComposer(),
    );
  }
}
