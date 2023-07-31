import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/second_example_provider.dart';

class SecondExample extends StatefulWidget {
  const SecondExample({super.key});

  @override
  State<SecondExample> createState() => _SecondExampleState();
}

class _SecondExampleState extends State<SecondExample> {

// double values = 1.0;
  @override
  Widget build(BuildContext context) {

    // esko yaha se remove tab kare ge jab consumer user kare ge aapa
   // final provider = Provider.of<SliderProvider>(context, listen: false);
    

    print('ankitdhattarwal');
    return Scaffold(
      appBar: AppBar(
       title: const Text(
           'State-Management'
       ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // consumer mai <> enn dono k bech class ko dena important hai varana usko pata kase chale ga ki values kiska hai
          Consumer<SliderProvider>(builder: (context, value, child){
            return   Slider(value: value.values, onChanged: (val){
              //  print(values);
              //  values = val;
              //    setState(() {
              //
              //    });
              value.setValue(val);
            });
          }),

          Consumer<SliderProvider>(builder: (context, value, child){
            return  Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration:  BoxDecoration(
                      color: Colors.green.withOpacity(value.values),
                    ),
                    child: const Center(
                      child: Text(
                        'Hit Me',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration:  BoxDecoration(
                      color: Colors.red.withOpacity(value.values),
                    ),
                    child: const Center(
                      child: Text(
                        'Hit Me',
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),


          // Ess row ko ab consumer mai daal denge aapa take aapna code chl cahke or chnage ho sake
          // Row(
          //   children: [
          //     Expanded(
          //       child: Container(
          //         height: 100,
          //         decoration:  BoxDecoration(
          //           color: Colors.green.withOpacity(provider.values),
          //         ),
          //         child: const Center(
          //           child: Text(
          //             'Hit Me',
          //           ),
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       child: Container(
          //         height: 100,
          //         decoration:  BoxDecoration(
          //           color: Colors.red.withOpacity(provider.values),
          //         ),
          //         child: const Center(
          //           child: Text(
          //             'Hit Me',
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
