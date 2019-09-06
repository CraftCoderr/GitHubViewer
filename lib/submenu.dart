import 'package:flutter/material.dart';

class SubmenuPageController {
  
  int _size;
  int _currentIndex;

  SubmenuPageViewState _pageView;
  SubmenuBarState _submenuBar;

  SubmenuPageController(this._size, int initialIndex) {
    _currentIndex = initialIndex;
  }

  void setCurrentIndex(int index) {
    assert(index >= 0);
    assert(index < _size);
    _currentIndex = index;
    _pageView._setCurrentIndex(_currentIndex);
    _submenuBar._setCurrentIndex(_currentIndex);
  }

  void setPageView(SubmenuPageViewState pageView) {
    _pageView = pageView;
    _pageView._setCurrentIndex(_currentIndex);
  }

  void setSubmenuBar(SubmenuBarState submenuBar) {
    _submenuBar = submenuBar;
    _submenuBar._setCurrentIndex(_currentIndex);
  }

}

class SubmenuPageView extends StatefulWidget {
  final SubmenuPageController controller;
  final List<Widget> children;

  const SubmenuPageView({Key key, this.controller, this.children}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SubmenuPageViewState();

  
}

class SubmenuPageViewState extends State<SubmenuPageView> {

  int _currentIndex = 0;

  @override
  void initState() {
    widget.controller.setPageView(this);
  }

  void _setCurrentIndex(int index) {
    _currentIndex = index;
    setState(() {

    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.children[_currentIndex],
    );
  }

}

abstract class Submenu {
  Widget buildActive(BuildContext context);
  Widget buildInactive(BuildContext context);
}

class StatelessSubmenu extends Submenu {

  final String _title;

  StatelessSubmenu(this._title);

  @override
  Widget buildActive(BuildContext context) {
    return Text(_title, 
      style: Theme.of(context).appBarTheme.textTheme.subtitle.copyWith(
        color: Colors.white, fontWeight: FontWeight.bold
      ),
    );
  }

  @override
  Widget buildInactive(BuildContext context) {
    return Text(_title, 
      style: Theme.of(context).appBarTheme.textTheme.subtitle,
    );
  }

}

class StatefulSubmenu extends Submenu {

  final String _title;
  final int _state;

  StatefulSubmenu(this._title, this._state);

  @override
  Widget buildActive(BuildContext context) {
    return Row(children: <Widget>[
      Text(_title, style: Theme.of(context).appBarTheme.textTheme.subtitle.copyWith(
        color: Colors.white, fontWeight: FontWeight.bold
      ),),
      Container(
        margin: EdgeInsets.only(left: 4), 
        padding: EdgeInsets.only(left: 5, right: 5), 
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 69, 73, 77),
        ), 
        child: Text('$_state', style: Theme.of(context).appBarTheme.textTheme.subtitle.copyWith(fontWeight: FontWeight.bold),),
      )
    ],);
  }

  @override
  Widget buildInactive(BuildContext context) {
    return Row(children: <Widget>[
      Text(_title, style: Theme.of(context).appBarTheme.textTheme.subtitle,),
      Container(
        margin: EdgeInsets.only(left: 4), 
        padding: EdgeInsets.only(left: 5, right: 5), 
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 69, 73, 77),
        ), 
        child: Text('$_state', style: Theme.of(context).appBarTheme.textTheme.subtitle.copyWith(fontWeight: FontWeight.bold),),
      )
    ],);
  }

}

class SubmenuBar extends StatefulWidget {

  final SubmenuPageController controller;
  final List<Submenu> submenus;
  
  const SubmenuBar({Key key, this.submenus, this.controller}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SubmenuBarState();
}

class SubmenuBarState extends State<SubmenuBar> {
  int _currentIndex;

  @override
  void initState() {
    widget.controller.setSubmenuBar(this);
  }

  void _setCurrentIndex(int index) {
    _currentIndex = index;
    setState(() {
      
    });
  }

  Widget _submenuPadding(Widget submenu, int index) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 18),
      child: GestureDetector(
        child: submenu,
        onTap: () => widget.controller.setCurrentIndex(index),
      )
    );
  }

  List<Widget> _buildSubmenu() {
    List<Widget> children = <Widget>[];
    for (int i = 0; i < widget.submenus.length; i++) {
      if (_currentIndex == i) {
        children.add(_submenuPadding(widget.submenus[i].buildActive(context), i));
      } else {
        children.add(_submenuPadding(widget.submenus[i].buildInactive(context), i));
      }
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _buildSubmenu(),
      ),
    );
  }
}