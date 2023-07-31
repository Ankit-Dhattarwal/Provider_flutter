import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_flutter/screen/count_example.dart';
import 'package:state_management_flutter/screen/second_example.dart';

import 'Provider/count_provider.dart';
import 'Provider/second_example_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // Multiple providers
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider(),),
        ChangeNotifierProvider(create: (_) => SliderProvider(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SecondExample(),
      ),
    );



    // This is the example of the single provider

    // return ChangeNotifierProvider(
    //   create: (_) => CountProvider(),
    //   child: MaterialApp(
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //     ),
    //     home: const SecondExample(),
    //   ),
    // );
    // return      <-->  // yaha se materialApp ko remove kiya or changeNotifier ka child bana deya
  }
}

