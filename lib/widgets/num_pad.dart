import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// KeyPad widget
// This widget is reusable and its buttons are customizable (color, size)
class NumPad extends StatelessWidget {
  final Color iconColor;
  final TextEditingController controller;
  final Function delete;
  final Function onSubmit;

  NumPad({
    Key? key,
    this.iconColor = Colors.white,
    required this.delete,
    required this.onSubmit,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // implement the number keys (from 0 to 9) with the NumberButton widget
              // the NumberButton widget is defined in the bottom of this file
              children: [
                SizedBox(
                  height: 40,
                ),
                NumberButton(
                  number: 1,
                  controller: controller,
                ),
                const Spacer(),
                NumberButton(
                  number: 2,
                  controller: controller,
                ),
                const Spacer(),
                NumberButton(
                  number: 3,
                  controller: controller,
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButton(
                  number: 4,
                  controller: controller,
                ),
                const Spacer(),
                NumberButton(
                  number: 5,
                  controller: controller,
                ),
                const Spacer(),
                NumberButton(
                  number: 6,
                  controller: controller,
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButton(
                  number: 7,
                  controller: controller,
                ),
                const Spacer(),
                NumberButton(
                  number: 8,
                  controller: controller,
                ),
                const Spacer(),
                NumberButton(
                  number: 9,
                  controller: controller,
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberButton(
                  number: 0,
                  controller: controller,
                ),
                const Spacer(),

                NumberButton(
                  number: 0,
                  controller: controller,
                ),
                const Spacer(),

                // this button is used to delete the last number
                IconButton(
                  onPressed: () => delete(),
                  icon: Icon(
                    Icons.backspace_outlined,
                    color: iconColor,
                  ),
                  iconSize: 40,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.only(
                  top: 40.0,
                ),
                height: 72,
                width: window.physicalSize.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0.0, 1.5),
                      color: Color.fromRGBO(62, 59, 59, 0.21176470588235294),
                      spreadRadius: 0,
                      blurRadius: 3,
                    ),
                  ],
                  color: const Color(0xff85488A),
                ),
                child: CupertinoButton(
                  child: const Text(
                    'Proceed',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  onPressed: () => onSubmit(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// define NumberButton widget
// its shape is round
class NumberButton extends StatelessWidget {
  final int number;
  final TextEditingController controller;

  NumberButton({
    Key? key,
    required this.number,
    required this.controller,
  }) : super(key: key);

  final NumberFormat f = NumberFormat.currency(name: 'NGN');

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          textStyle: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500)),
      onPressed: () {
        controller.text += number.toString();
      },
      child: Center(
        child: Text(
          f.format(number.toString()),
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}
