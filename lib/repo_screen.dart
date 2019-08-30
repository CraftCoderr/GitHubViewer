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

  RepoModel repo = RepoModel(1, 'Test', 'User/Github', 'Very long description overalll over=fnadsnfjnsgdnf/', UserModel('User', 1, 'user/User'), 10);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: _buildTitle(),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Octicons.three_bars, color: Colors.white,),
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Container(
            height: 36,
            child: Scrollbar(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _buildSubmenu(),
              ),
            ),
          ),
        ),
        brightness: Brightness.dark,
      ),
      drawer: Drawer(),
      body: _buildBody(),
    );
  }

  List<Widget> _buildSubmenu() {
    var submenu = <Widget>[];
    for (var i = 0; i < 10; i++) {
        submenu.add(Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: GestureDetector(
            child: Text('text_$i', 
              style: Theme.of(context).appBarTheme.textTheme.subtitle,
            ),
            onTap: () => print('text_$i'),
          )
        ));
    }
    return submenu;
  }

  Widget _buildBody() {
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

  Widget _buildTitle() {
    if (repo != null) {
      return 
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 5,
              child: Icon(Octicons.repo, color: Colors.grey),
            ),
            Spacer(flex: 1,),
            Flexible(
              flex: 20,
              child: Text(repo.fullName.split('/')[0], 
                style: Theme.of(context).appBarTheme.textTheme.title.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(flex: 1,),
            Flexible(
              flex: 1,
              child: Text('/', 
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Spacer(flex: 2,),
            Flexible(
              flex: 20,
              child: Text(repo.fullName.split('/')[1], 
                style: Theme.of(context).appBarTheme.textTheme.title.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
    } else {
      return Text('Loading...');
    }
  }

}