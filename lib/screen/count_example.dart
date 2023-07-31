import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_flutter/Provider/count_provider.dart';

import '../Provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final cntProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      cntProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {

    final cntProvider = Provider.of<CountProvider>(context, listen: false);   /* <> IN Dono ki beach mai aapa class create kre hi va daal deya ga */
    print('ankit');

    return Scaffold(
      appBar: AppBar(
        title: const Text('State-Management'),
      ),
      body:  Center(

        // child: Text(cntProvider.count.toString(), // ura jo naam declare kar hai upar voo use karna hai yaad rakhi
        //   style: const TextStyle(fontSize: 50),
        // ),

        //Consumer ka use kara ga taki baar build na puri screen
        child:  Consumer<CountProvider>(builder: (context, value , child){
          print('only this widget bulid');
          //Jab consumer class ko rebuild hona hai na tab esko context chaye ( jis class ka increament karna hai )
          return Text(value.count.toString(), // ura jo naam declare kar hai upar voo use karna hai yaad rakhi
            style: const TextStyle(fontSize: 50),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          cntProvider.setCount();  // eb sara yo naam use karna hai voo upr declare kara hai aapa na
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


// Note initState first call then build function call ///*** important;