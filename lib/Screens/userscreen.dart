import 'package:flutter/material.dart';
import 'package:lab8/Screens/userdetails.dart';
import 'package:lab8/Widgets/mycard.dart';
import 'package:lab8/model/users.dart';
import 'package:lab8/services/userservice.dart';
import '../utilities.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  bool loading = true;
  List<User> users = [];

  getUserList() async {
    users = await UsersService().getUsers();
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users Screen")),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: () {
                          pushPage(context, UserDetails(users[index]));
                        },
                        child: MyCard(content: '${users[index].name}')));
              },
            ),
    );
  }
}
