import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:purple/screens/new%20project/account_details.dart';
import 'package:purple/screens/new%20project/project4.dart';
import 'package:purple/screens/new%20project/project5.dart';
import 'package:purple/utils/colors.dart';
import 'package:purple/widgets/progres_bar.dart';
import 'package:purple/screens/new%20project/project.dart';
import 'package:purple/screens/new%20project/project2.dart';
import 'package:purple/screens/new%20project/project3.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  final controller = PageController(
    initialPage: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assetName'),
          const Text(
            'data',
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 100,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ProjectScreen1(),
                ),
              );
            },
            child: Container(
              width: 270,
              height: 70,
              color: const Color.fromRGBO(80, 216, 195, 1),
              margin: const EdgeInsets.only(
                left: 74,
                bottom: 62,
                right: 74,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: const Text(
                'Get Started',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void postImage(
  String uid,
  String username,
  String profImage,
) {
  try {} catch (e) {}
}
