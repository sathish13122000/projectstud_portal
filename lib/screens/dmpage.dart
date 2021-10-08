import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stud_portal/components/nav_bar.dart';

import 'private_chat.dart';

class DmPage extends StatelessWidget {
  const DmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return a page that list all the dm's
    // create a list of friends with random names
    var friends = List<String>.generate(10, (i) => "Friend ${i + 1}");
    // display the list of friends in a list view
    var friendsList = ListView(
      children: friends
          .map((friend) => ListTile(
                title: Text(friend),
                subtitle: Text("Hey, there!!!"),
                leading: Icon(
                  Icons.person,
                ),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  // navigate to the dm page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => private_chat(
                        friend,
                      ),
                    ),
                  );
                },
              ))
          .toList(),
    );
    // return a page showing the friends list
    return Scaffold(
      bottomNavigationBar: NavBar(),
      appBar: AppBar(
        title: Text("Direct Messages"),
      ),
      body: friendsList,
    );
    // create a list of messages with random text
  }
}
