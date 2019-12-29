import 'package:flutter/material.dart';
import 'SecondRoute.dart';

void main() {
   runApp(MaterialApp(
    title: 'Named Routes Demo',
    initialRoute: '/',
    routes: <String, WidgetBuilder> {
      '/': (context) => FirstScreen(),
      '/second': (context) => SecondRoute(),
      ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen(),
    },
  ));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                RaisedButton(
                  child: Text('Open route'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/second');
                  },
                ),
              ],
            ),
            Column(
              children: <Widget>[
                RaisedButton(
                  child: Text('Open route with param'),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      ExtractArgumentsScreen.routeName,
                      arguments: ScreenArguments(
                        'Extract Arguments Screen',
                        'This message is extracted in the build method.',
                      ),
                    );
                  },
                ),
              ],
            )

          ],
        )
      ),
    );
  }
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}


class ExtractArgumentsScreen extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute settings and cast
    // them as ScreenArguments.
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}
