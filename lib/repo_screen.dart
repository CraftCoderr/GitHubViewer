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

  RepoModel repo = RepoModel(1, 'Test', 'Bill-Gray/PDCurses', 'Very long description overalll over=fnadsnfjnsgdnf/', UserModel('User', 1, 'user/User'), 10);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: _buildTitle(),
        backgroundColor: Theme.of(context).appBarTheme.color,
        leading: IconButton(
          icon: Icon(Octicons.three_bars, color: Colors.white,),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Octicons.bell, color: Colors.white, size: 20),
            onPressed: () => showDialog(
              context: context, 
              builder: (context) => Text('Notifications pressed.')
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(36),
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

  List<String> submenus = <String>[
    'Code', 'Issues', 'Pull requests', 'Projects', 'Wiki', 'Security', 'Pulse'
  ];

  Widget _submenuPadding(Widget submenu) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 18),
      child: GestureDetector(
        child: submenu,
        onTap: () => print('Click ${submenu.hashCode}'),
      )
    );
  }

  Widget _buildStatefulSubmenu(String title, int state) {
    return _submenuPadding(Row(children: <Widget>[
      Text(title, style: Theme.of(context).appBarTheme.textTheme.subtitle,),
      Container(
        margin: EdgeInsets.only(left: 4), 
        padding: EdgeInsets.only(left: 5, right: 5), 
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 69, 73, 77),
        ), 
        child: Text('$state', style: Theme.of(context).appBarTheme.textTheme.subtitle.copyWith(fontWeight: FontWeight.bold),),
      )
    ],));
  }

  Widget _buildStatelessSubmenu(String title) {
    return _submenuPadding(Text(title, 
      style: Theme.of(context).appBarTheme.textTheme.subtitle,
    ),);
  }

  List<Widget> _buildSubmenu() {
    var submenu = <Widget>[
      _buildStatelessSubmenu('Code'),
      _buildStatefulSubmenu('Issues', 23),
      _buildStatefulSubmenu('Pull requests', 4),
      _buildStatefulSubmenu('Projects', 0),
      _buildStatelessSubmenu('Wiki'),
      _buildStatelessSubmenu('Security'),
      _buildStatelessSubmenu('Pulse')
    ];
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
                style: Theme.of(context).appBarTheme.textTheme.title,
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
                style: Theme.of(context).appBarTheme.textTheme.title,
              ),
            ),
          ],
        );
    } else {
      return Text('Loading...');
    }
  }

}
