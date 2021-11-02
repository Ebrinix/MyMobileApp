import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  void _showBottom() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return new Container(
              padding: new EdgeInsets.all(15.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    'Some info here ',
                    style: new TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  new RaisedButton(
                    onPressed: () => Navigator.pop(context),
                    child: new Text('Close'),
                  )
                ],
              ));
        });
  }

  List<BottomNavigationBarItem> _items =
      List<BottomNavigationBarItem>.empty(growable: true);
  String _value = '';
  int _index = 0;

  @override
  void initState() {
    // _items = new List();
    _items.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.people), title: new Text('People')));
    _items.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.mobile_friendly), title: new Text('Phone')));
    _items.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.message), title: new Text('Message')));
    // _items.add(new BottomNavigationBarItem(
    //     icon: new Icon(Icons.messenger), title: new Text('Messenger')));
  }

  TextEditingController _user = new TextEditingController();
  TextEditingController _pass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
          padding: new EdgeInsets.all(22.0),
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Text(_value),
                new Text('Add Widget Here'),
                new RaisedButton(
                  onPressed: _showBottom,
                  child: new Text('Click me'),
                ),
                Padding(
                  padding: new EdgeInsets.all(12.0),
                ),
                new Text('Please Login'),
                new Row(children: <Widget>[
                  new Text('Username: '),
                  new Expanded(
                      child: TextField(
                    controller: _user,
                  ))
                ]),
                new Row(children: <Widget>[
                  new Text('Password: '),
                  new Expanded(
                      child: TextField(
                    controller: _pass,
                    obscureText: true,
                  ))
                ]),
                new Padding(
                  padding: new EdgeInsets.all(32.0),
                  child: new RaisedButton(
                    onPressed: () => print('Login ${_user.text}'),
                    child: new Text('Click me'),
                  ),
                ),
                new Card(
                  child: new Container(
                    width: double.infinity,
                    padding: new EdgeInsets.all(32.0),
                    child: new Column(
                      children: <Widget>[
                        new Text('Hello World'),
                        new Text('How are you?'),
                      ],
                    ),
                  ),
                ),
                new Card(
                  child: new Container(
                    padding: new EdgeInsets.all(32.0),
                    child: new Column(
                      children: <Widget>[
                        new Text('Hello World'),
                        new Text('How are you?'),
                      ],
                    ),
                  ),
                ),
                new Card(
                  child: new Container(
                    padding: new EdgeInsets.all(32.0),
                    child: new Column(
                      children: <Widget>[
                        new Text('Hello World'),
                        new Text('How are you?'),
                      ],
                    ),
                  ),
                ),
                // new Column(new Text('Add widget here')),
              ],
            ),
          )),
      bottomNavigationBar: new BottomNavigationBar(
        items: _items,
        fixedColor: Colors.blue,
        currentIndex: _index,
        onTap: (int item) {
          setState(() {
            _index = item;
            _value = "Current value is: ${_index.toString()}";
          });
        },
      ),
    );
  }
}
