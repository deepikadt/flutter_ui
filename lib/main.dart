import 'package:flutter/material.dart';
import 'package:flutter_ui/utils/theme.dart';

void main() => runApp(MyApp());

bool darkMode = true;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "sample_ui",
      theme: basicTheme(2, false),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Themes",
          style: Theme.of(context).textTheme.headline.merge(
                TextStyle(color: Colors.white),
              ),
        ),
        actions: <Widget>[
          Switch(
            value: false,
            onChanged: (value) => () {
              //do somthing
            },
          ),
          //change a particular property of icon theme and keeping other app theme same
          Theme(
              child: Icon(Icons.settings),
              data: Theme.of(context).copyWith(
                iconTheme:
                    IconThemeData(color: false ? Colors.white : Colors.grey),
              )),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "headline",
                style: Theme.of(context).textTheme.headline,
              ),
              Text(
                "subhead",
                style: Theme.of(context).textTheme.subhead,
              ),
              Text(
                "subtitle",
                style: Theme.of(context).textTheme.subtitle,
              ),
              Text(
                "body1",
                style: Theme.of(context).textTheme.body1,
              ),
              Text(
                "body2",
                style: Theme.of(context).textTheme.body2,
              ),
              Text(
                "caption",
                style: Theme.of(context).textTheme.caption,
              ),
              Text(
                "overline",
                style: Theme.of(context).textTheme.overline,
              ),
              Text(
                "display1",
                style: Theme.of(context).textTheme.display1,
              ),
              Text(
                "display2",
                style: Theme.of(context).textTheme.display2,
              ),
              Text(
                "display3",
                style: Theme.of(context).textTheme.display3,
              ),
              Text(
                "display4",
                style: Theme.of(context).textTheme.display4,
              ),
              RaisedButton(
                child: Text("Button text"),
                onPressed: () {},
              ),
              Icon(Icons.star),
            ],
          ),
        ),
      ),
    );
  }
}
