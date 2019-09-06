import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:github_viewer/repo/code_page.dart';

import 'repo_model.dart';
import '../submenu.dart';
import '../user/user_model.dart';

class RepoScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => RepoScreenState();

}

class RepoScreenState extends State<RepoScreen> {

  RepoModel repo = RepoModel(1, 'Test', 'Bill-Gray/PDCurses', 'Very long description overalll over=fnadsnfjnsgdnf/', UserModel('User', 1, 'user/User'), 10);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final SubmenuPageController controller = SubmenuPageController(7, 0);

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
            child: SubmenuBar(controller: controller, submenus: [
              StatelessSubmenu('Code'),
              StatefulSubmenu('Issues', 23),
              StatefulSubmenu('Pull requests', 4),
              StatefulSubmenu('Projects', 0),
              StatelessSubmenu('Wiki'),
              StatelessSubmenu('Security'),
              StatelessSubmenu('Pulse'),
            ],)
          ),
        ),
        brightness: Brightness.dark,
      ),
      drawer: Drawer(),
      body: SubmenuPageView(controller: controller, children: _buildPages(7),),
    );
  }

  List<Widget> _buildPages(int size) {
    List<Widget> pages = <Widget>[CodePage()];
    for (int i = 1; i < size; i++) {
      pages.add(Center(child: Text('page_$i')));
    }
    return pages;
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
