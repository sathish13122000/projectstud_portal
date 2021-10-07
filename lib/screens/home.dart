// import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stud_portal/model/user.dart';
import 'package:stud_portal/screens/login.dart';
// import 'package:image_picker/image_picker.dart';

// import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModal logedInUser = UserModal();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.logedInUser = UserModal.fromMap(value.data());
      setState(() {});
    });
  }

  // DateTime now = DateTime.now().toLocal();
  // String time = DateFormat.yMMMd().format(now);
  Widget _buildInput() => Container(
        //padding: EdgeInsets.only(bottom: 20),
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border(
                top: BorderSide(
              color: Colors.grey,
            ))),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 6),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Message #channel",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.alternate_email),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.text_format),
                    onPressed: () {},
                  ),
                  Expanded(child: Container()),
                  IconButton(
                    icon: Icon(Icons.description),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.perm_media),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      );
  Widget _buildMessage() => ListTile(
        leading: Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(4),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202012/chris-ried-ieic5Tq8YMk-unsplas_1200x768.jpeg?bEhcYQAShJnLf0Mtu4JYq8YzICfhz2rB&size=770:433')),
          ),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Channel Name",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "                2:35 PM ",
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
        subtitle: Text(
          "Message Section....",
          //style: TextStyle(color: Theme.of(context).textTheme.bodyText1.color)
        ),
        isThreeLine: false,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   onPressed: () {},
          // ),
          elevation: 0,
          centerTitle: false,
          title: Text('#channel'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
          bottom: PreferredSize(
              child: Container(
                  height: 3, width: double.infinity, color: Colors.grey[700]),
              preferredSize: Size.fromHeight(1))),
      body: SafeArea(
        bottom: true,
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: <Widget>[
                _buildMessage(),
                _buildMessage(),
                _buildMessage(),
                _buildMessage(),
                _buildMessage(),
                _buildMessage(),
              ],
            )),
            _buildInput(),
          ],
        ),
      ),
      drawer: Drawer(
        child: SafeArea(
          top: true,
          child: Column(
            children: [
              Container(
                  height: kToolbarHeight,
                  width: double.infinity,
                  color: Colors.black12,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://tse2.mm.bing.net/th?id=OIP._FIEm6ykY8CgWovNz29nfQHaIp&pid=Api&P=0&w=300&h=300')),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Welcome !!! ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${logedInUser.uname}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        // child: TextField(
                        //   decoration: InputDecoration(
                        //       prefixIcon: Icon(Icons.search),
                        //       hintText: "Jump to ...",
                        //       //filled: true,
                        //       border: OutlineInputBorder(
                        //           borderSide: BorderSide.none)),
                        // ),
                      )
                    ],
                  )),
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Channels",
                              style: Theme.of(context).textTheme.caption),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.add_circle_outline)),
                        ],
                      ),
                    ),
                    _buildDrawerListItem(true),
                    _buildDrawerListItem(true),
                    _buildDrawerListItem(true),
                    _buildDrawerListItem(true),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("DirectMessages",
                              style: Theme.of(context).textTheme.caption),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.add_circle_outline)),
                        ],
                      ),
                    ),
                    _buildDrawerListItem(false),
                    _buildDrawerListItem(false),
                    _buildDrawerListItem(false),
                    _buildDrawerListItem(false),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              logout(context);
                            },
                            icon: Icon(Icons.logout),
                          ),
                          Text("Logout"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerListItem(bool isChannel) => InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                  width: 16,
                  child: isChannel
                      ? Text("#")
                      : Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ))),
              Expanded(
                child: Text(isChannel ? "ChannelTitle" : "SenderName"),
              )
            ],
          ),
        ),
      );

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
  }
}
