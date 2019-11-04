import 'package:flutter/material.dart';
import 'package:flutter_ui/utils/theme.dart';
import 'bloc/theme_bloc.dart';

void main() => runApp(MyApp());

final bloc = ThemeBloc();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: 1,
      stream: bloc.colorChanged,
      builder: (context, colorSnapshot) => StreamBuilder(
          initialData: false,
          stream: bloc.darkThemeEnabled,
          builder: (context, snapshot) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "sample_ui",
              theme: colorSnapshot.data == 1
                  ? (snapshot.data ? basicTheme(1, true) : basicTheme(1, false))
                  : (snapshot.data
                      ? basicTheme(2, true)
                      : basicTheme(2, false)),
              home: MyHome(snapshot.data,colorSnapshot.data),
            );
          }),
    );
  }
}

class MyHome extends StatefulWidget {
  final bool darkThemeEnabled;
  final int appColorChanged;

  MyHome(this.darkThemeEnabled,this.appColorChanged);

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
            value: widget.darkThemeEnabled,
            onChanged: bloc.changeTheme,
          ),
          PopupMenuButton(
            padding: const EdgeInsets.only(right: 20.0),
            onSelected: bloc.changeThemeColor,
            child:
                //change a particular property of icon theme and keeping other app theme same
                Theme(
              child: Icon(Icons.settings),
              data: Theme.of(context).copyWith(
                iconTheme:
                    IconThemeData(color: false ? Colors.white : Colors.grey),
              ),
            ),
            itemBuilder: (context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: Text("pink"),
                enabled: true,
                value: 2,
              ),
              PopupMenuItem(
                child: Text("blue"),
                enabled: true,
                value: 1,
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
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
                  child: Text(
                    "Button text",
                    style: Theme.of(context).textTheme.button,
                  ),
                  onPressed: () {},
                ),
                Icon(Icons.star),
                //text field takes primary color for the underline
                //for cursor .. set color on your own.It takes blue automatically
                TextField(
                  style: Theme.of(context).textTheme.display2,
                  cursorColor: Theme.of(context).accentColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
