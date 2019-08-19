import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'repo/repo_model.dart';
import 'user/user_model.dart';

class RepoScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => RepoScreenState();

}

class RepoScreenState extends State<RepoScreen> {

  RepoModel repo = RepoModel(1, 'Test', 'User/test', 'Very long description overalll over=fnadsnfjnsgdnf/', UserModel('User', 1, 'user/User'), 10);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: buildTitle(),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Octicons.three_bars, color: Colors.white),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Octicons.bell, color: Colors.white),
            onPressed: () => showDialog(
              context: context, 
              builder: (context) => Text('Notifications pressed.')
            ),
          )
        ],
      ),
      drawer: Drawer(),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    if (repo != null) {
      return Center(
        child: Text(repo.description),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  Widget buildTitle() {
    if (repo != null) {
      return Center(child: 
        Row(
          children: <Widget>[
            Icon(Octicons.repo, color: Colors.grey),
            Text(repo.fullName.split('/')[0], 
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(' / ', style: TextStyle(color: Colors.grey),),
            Text(repo.fullName.split('/')[1], 
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        )
      );
    } else {
      return Text('Loading...');
    }
  }

}