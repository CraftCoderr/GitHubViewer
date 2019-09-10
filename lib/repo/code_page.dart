import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class CodePage extends StatelessWidget {

  Color blue = Color.fromARGB(255, 3, 102, 214);
  Color lightBlue = Color.fromARGB(255, 231, 243, 255);

  EdgeInsetsGeometry padding = EdgeInsets.only(top: 16, bottom: 16);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView(
      padding: EdgeInsets.all(16),
      children: <Widget>[
        Text('description', textAlign: TextAlign.left,),
        Container(
          margin: EdgeInsets.only(top: 8, bottom: 8),
          child: Row(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: lightBlue
              ),
              padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 4),             
              child: Text('tag', style: TextStyle(color: blue),),
            )
          ],),
        ),
        Container(
          margin: EdgeInsets.only(top: 8, bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: Colors.white,
            border: Border.all(color: Colors.grey),
          ),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: padding,
                  child: Center(child: Row(children: <Widget>[
                    Icon(Octicons.star, color: blue, size: 18,),
                    Container(
                      margin: EdgeInsets.only(left: 4),
                      child: Text('Unstar', style: TextStyle(color: blue, fontWeight: FontWeight.bold),)
                    )
                  ],),),
                ),
                VerticalDivider(color: Colors.grey, width: 1,),
                Center(child: Row(children: <Widget>[
                  Icon(Octicons.eye, color: blue, size: 18,),
                  Container(
                    margin: EdgeInsets.only(left: 4),
                    child: Text('Watch', style: TextStyle(color: blue, fontWeight: FontWeight.bold),)
                  )
                ],),)
            ],),
          ),
        ),
        ConstrainedBox(constraints: BoxConstraints(maxHeight: 600), child: Markdown(data: readme,),)
      ],),
    );
  }
  

  final String readme = """
  Welcome to PDCurses!
====================

Public Domain Curses, aka PDCurses, is an implementation of X/Open
curses for multiple platforms. Relative to the 'official' PDCurses
project,  this has a variety of improvements,  adding a Windows GUI
and a VT-like console "flavor" of Curses and expanding the
capabilities of the other flavors (SDL1,  SDL2,  X11, Win32 console,
OS/2, and DOS).  Some details and screen shots at

https://www.projectpluto.com/win32a.htm

Much of this was done during a long period in which 'official'
PDCurses was inactive.  It is hoped that the changes in this fork
can be merged into the 'official' PDCurses,  and a pull request has
been made.  But the split is looking increasingly permanent.

Legal Stuff
-----------

The core package is in the public domain, but small portions of PDCurses
are subject to copyright under various licenses.  Each directory
contains a README file, with a section titled "Distribution Status"
which describes the status of the files in that directory.

If you use PDCurses in an application, an acknowledgement would be
appreciated, but is not mandatory. If you make corrections or
enhancements to PDCurses, please forward them to the current maintainer
for the benefit of other users.

This software is provided AS IS with NO WARRANTY whatsoever.


Ports
-----

PDCurses has been ported to DOS, OS/2, Win32, X11 and SDL1 and SDL2,
and this version adds a Windows graphical and VT-like console
flavor. A directory containing the port-specific source files exists
for each of these platforms.

Build instructions are in the README file for each platform:

-  [DOS](dos/README.md) for use on DOS
-  [OS/2](os2/README.md) for use on OS/2
-  [SDL 1.x](sdl1/README.md) for use as separate SDL version 1 window
-  [SDL 2.x](sdl2/README.md) for use as separate SDL version 2 window
-  [wincon](wincon/README.md) (formerly win32) for use on Windows Console
-  [WinGUI](wingui/README.md) for use on Windows Graphics Mode
-  [X11](x11/README.md) (also called XCurses) for use as separate X11 window
-  [VT](vt/README.md) for use on terminal

Distribution Status
-------------------

All files in this directory except configure, config.guess and
config.sub are released to the Public Domain. config.guess and
config.sub are under the GPL; configure is under a free license
described within it.

Build Status
-------------------

PDCurses is automatically build in multiple environments:

[![Build status Travis-CI](https://api.travis-ci.com/Bill-Gray/PDCurses.svg?branch=master)](https://travis-ci.com/Bill-Gray/PDCurses)
, also providing artifacts: [![Build status Appveyor](https://ci.appveyor.com/api/projects/status/github/Bill-Gray/PDCurses?branch=master&svg=true)](https://ci.appveyor.com/project/Bill-Gray/PDCurses)


Maintainer
----------

William McBrine <wmcbrine@gmail.com>  ("official" PDCurses)

Bill Gray
p&#x202e;&ocirc;&#xe7;.&ouml;tulp&#x165;c&eacute;j&ocirc;&#x159;p&#x40;ot&uacute;l&#x202c;m
(this fork)
  """;
}