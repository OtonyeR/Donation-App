import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:purple/screens/new%20project/project2.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({Key? key}) : super(key: key);

  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Give your project a fitting title',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        CupertinoTextField(
          placeholder: 'Name of Account Holder',
          placeholderStyle: const TextStyle(
            color: Color(0xE3D5D5D3),
          ),
          keyboardType: TextInputType.text,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(101, 45, 105, 0.2),
            borderRadius: BorderRadius.circular(32),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0),
                blurRadius: 4.0,
                spreadRadius: 0.0,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        CupertinoTextField(
          keyboardType: TextInputType.number,
          placeholder: 'Account Number',
          placeholderStyle: const TextStyle(
            color: Color(0xE3D5D5D3),
          ),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(101, 45, 105, 0.2),
            borderRadius: BorderRadius.circular(32),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0),
                blurRadius: 4.0,
                spreadRadius: 0.0,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        CupertinoTextField(
          keyboardType: TextInputType.text,
          placeholder: 'Bank',
          placeholderStyle: const TextStyle(
            color: Color(0xE3D5D5D3),
          ),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(101, 45, 105, 0.2),
            borderRadius: BorderRadius.circular(32),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0),
                blurRadius: 4.0,
                spreadRadius: 0.0,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 70,
        ),
        Container(
          width: 270,
          height: 70,
          color: const Color.fromRGBO(80, 216, 195, 1),
          margin: const EdgeInsets.only(
            left: 74,
            bottom: 62,
            right: 74,
          ),
          child: CupertinoButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ProjectScreen2(),
                ),
              );
            },
            child: const Text(
              'Next',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            disabledColor: Colors.grey,
            pressedOpacity: 0.6,
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
          ),
        ),
      ],
    );
  }
}
