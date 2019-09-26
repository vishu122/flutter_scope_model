import 'package:flutter/material.dart';
import 'package:flutter_scope_model/counter_model.dart';
import 'package:get_it/get_it.dart';
import 'package:scoped_model/scoped_model.dart';

import 'service_locator.dart';

void main() {
  new ServiceLocator().setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<CounterModel>(
      model: CounterModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GetIt getIt = GetIt.instance;

//  CounterModel counterModel = new CounterModel();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    var counterModel = getIt<CounterModel>();
    return ScopedModel<CounterModel>(
      model: counterModel,
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  new ScopedModelDescendant<CounterModel>(
                    builder: (context, child, model) => new Text(
                          model.counter.toString(),
                          style: Theme.of(context).textTheme.display1,
                        ),
                  ),
                ],
              ),
//              Expanded(
              /*  child:*/ Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      FloatingActionButton(
                        onPressed: () {
                          counterModel.decrementCounter();
                        },
                        tooltip: 'Decrement',
                        child: Icon(Icons.remove),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          counterModel.incrementCounter();
                        },
                        tooltip: 'Increment',
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
//              ),
            ],
          ),
        ),

        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
