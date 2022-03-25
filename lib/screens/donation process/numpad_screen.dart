/*import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:purple/widgets/num_pad.dart';

class NumPad extends StatefulWidget {
  const NumPad({Key? key}) : super(key: key);

  @override
  _NumPadState createState() => _NumPadState();
}

class _NumPadState extends State<NumPad> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(101, 45, 105, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(top: 60),
            child: const Text(
              'Enter Amount',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                letterSpacing: 2.0,
              ),
            ),
          ),

          // display the entered numbers
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: 100,
              child: Container(
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 30,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xff85488A),
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ),
                      ),
                      child: const ImageIcon(
                        AssetImage('assetName'),
                        color: Colors.white,
                      ),
                    ),
                    TextField(
                      controller: controller,
                      textAlign: TextAlign.center,
                      showCursor: false,
                      maxLength: 9,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      style: const TextStyle(
                        fontSize: 65,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '0.00',
                        hintStyle: TextStyle(
                          color: Colors.white70,
                          fontSize: 65,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Disable the default soft keyboard
                      keyboardType: TextInputType.none,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // implement the custom NumPad
          Container(
            margin: const EdgeInsets.only(
              top: 40,
            ),
            child: NumPad(
              iconColor: Colors.white,
              controller: controller,
              delete: () {
                controller.text =
                    controller.text.substring(0, controller.text.length - 1);
              },
              // do something with the input numbers
              onSubmit: () {
                debugPrint('Your code: ${controller.text}');
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    content: Text(
                      "You code is ${controller.text}",
                      style: const TextStyle(fontSize: 50),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
*/
