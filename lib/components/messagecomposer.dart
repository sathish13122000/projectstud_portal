import 'package:flutter/material.dart';

class MessageComposer extends StatelessWidget {
  const MessageComposer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_camera),
            iconSize: 25.0,
            color: Colors.deepPurple,
            onPressed: () async {
              // File image = await ImagePicker.pickImage(source: ImageSource.gallery);
              // String imageUrl = await StorageService.uploadMessageImage(image);
              // Message message = Message(
              //   text: '',
              //   imageUrl: imageUrl,
              //   sender: logedInUser.id,
              //   timestamp: Timestamp.now(),
              // );
              // DatabaseService.createMessage(message);
            },
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Colors.deepPurple,
            onPressed: () {
              //Implement send functionality.
            },
          ),
        ],
      ),
    );
  }
}
