import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_flutter/screen/second_example.dart';

import 'Favourite/fav_with_state_management.dart';
import 'Favourite/screen/fav_screen.dart';
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
        // yaha par provider wale class ka naam use karana  hai voo class jaha aapa provider create kara ha
        ChangeNotifierProvider(create: (_) => CountProvider(),),
        ChangeNotifierProvider(create: (_) => SliderProvider(),),
        ChangeNotifierProvider(create: (_) => FavouriteItemProvider(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FavouriteScreen(),
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

