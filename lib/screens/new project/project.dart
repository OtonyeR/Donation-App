import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:purple/screens/new%20project/project2.dart';

class ProjectScreen1 extends StatefulWidget {
  const ProjectScreen1({Key? key}) : super(key: key);

  @override
  _ProjectScreen1State createState() => _ProjectScreen1State();
}

class _ProjectScreen1State extends State<ProjectScreen1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Which best describes your project?',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 40,
        ),
        GestureDetector(
          child: Container(
            child: const Text(
              'Community development/aid',
              textScaleFactor: 2,
              style: TextStyle(color: Colors.white),
            ),
            height: 114,
            width: 368,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xff652D69),
            ),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        GestureDetector(
          child: Container(
            child: const Text(
              'Personal Project',
              textScaleFactor: 2,
              style: TextStyle(color: Colors.black),
            ),
            height: 114,
            width: 368,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(
                  width: 2.0,
                  color: const Color(0xff652D69),
                )),
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
