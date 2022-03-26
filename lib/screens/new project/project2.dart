import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:purple/screens/new%20project/project3.dart';

class ProjectScreen2 extends StatefulWidget {
  const ProjectScreen2({Key? key}) : super(key: key);

  @override
  _ProjectScreen2State createState() => _ProjectScreen2State();
}

class _ProjectScreen2State extends State<ProjectScreen2> {
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
        const CupertinoTextField(
          keyboardType: TextInputType.text,
        ),
        const Text(
          'Describe your project',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 100,
          height: 40,
          child: CupertinoTextField(
            keyboardType: TextInputType.text,
            minLines: 5,
            maxLines: 6,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(
                101,
                45,
                105,
                0.11,
              ),
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
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          width: 50,
          child: Text.rich(
            TextSpan(
              text: 'Tip:',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Color(0xff652D69)), // default text style
              children: <TextSpan>[
                TextSpan(
                  text:
                      ' Try to make your project as transparent as possible to encourage donations',
                  style: TextStyle(
                    color: Color(0xff652D69),
                  ),
                ),
              ],
            ),
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
                  builder: (context) => const ProjectScreen3(),
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
