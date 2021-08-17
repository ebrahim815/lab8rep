import 'package:lab8/model/users.dart';
import 'package:lab8/widgets/mycard.dart';
import 'package:lab8/utilities.dart';
import 'package:flutter/material.dart';

import 'mapscreen.dart';

class UserDetails extends StatefulWidget {
  User user;
  UserDetails(this.user);
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          MyCard(
            content: "${widget.user.name}",
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                launchURL("mailto:${widget.user.email}");
              },
              child: Text("Email: ${widget.user.email}")),
          SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                launchURL("tel:${widget.user.phone}");
              },
              child: Text("phone: ${widget.user.phone}")),
          SizedBox(
            height: 10,
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                launchURL("https://${widget.user.website}");
              },
              child: Text("web: ${widget.user.website}")),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: InkWell(
                onTap: () {
                  pushPage(context, MapSample(
                  userLocation: widget.user.address.geo,));
                },
                child: Text("Map View"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
