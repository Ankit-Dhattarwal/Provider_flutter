import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Basic Provider'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureProvider<MyModel>(
      initialData: MyModel(UserName: 'UserName'),
      create: (BuildContext context) => GetModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Container(
                child: Consumer<MyModel>(builder: (context, MyModel, child) {
                  return Text('${MyModel.UserName}');
                }),
              ),
              Container(
                child: Consumer<MyModel>(builder: (context, MyModel, child) {
                  return ElevatedButton(
                      onPressed: () {
                        MyModel.doSomething();
                      }, child: const Text('Change Value'));
                }),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class MyModel  {
  String UserName;
  MyModel({required this.UserName});
  Future<void> doSomething() async {
    await Future.delayed(Duration(seconds: 2));
    UserName = "Ankit Dhattarwal";
    print(UserName);
  }

}
Future<MyModel> GetModel() async{
  await Future.delayed(Duration(seconds: 3));
  return MyModel(UserName: 'Amit Dhattarwal');
}
