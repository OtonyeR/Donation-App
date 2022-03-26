import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:purple/screens/donation%20process/numpad_screen.dart';
import 'package:purple/screens/project_progress_screen.dart';
import 'package:purple/utils/colors.dart';
import 'package:purple/widgets/num_pad.dart';

class ProjectDetails extends StatefulWidget {
  const ProjectDetails({Key? key}) : super(key: key);

  @override
  _ProjectDetailsState createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 378,
                width: window.physicalSize.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                      image: AssetImage("assets/images/bulb.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              Positioned(
                child: Container(
                  height: double.infinity,
                  width: window.physicalSize.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Text(' '),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.favorite_rounded),
                                    onPressed: () {},
                                  ),
                                  Text(''),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(
                                              Icons.favorite_rounded),
                                          onPressed: () {},
                                        ),
                                        Text(''),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            children: [
                                              IconButton(
                                                icon: const Icon(
                                                    Icons.favorite_rounded),
                                                onPressed: () {},
                                              ),
                                              Text(''),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '',
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              'data',
                              textAlign: TextAlign.end,
                            )
                          ],
                        ),
                        const Text(
                          'About Project',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: primaryColor,
                          ),
                        ),
                        Text(
                          'data',
                          style: const TextStyle(
                            fontSize: 30,
                            color: primaryColor,
                          ),
                        ),
                        const Text(
                          'Category',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: primaryColor,
                          ),
                        ),
                        /* Add category section*/
                        const Text(
                          'Acceptable Donations',
                          style: TextStyle(
                            fontSize: 18,
                            color: primaryColor,
                          ),
                        ),
                        /* Add donation section*/
                        Wrap(
                          spacing: 10,
                          children: [
                            Chip(
                              label: Text(''),
                              backgroundColor: Colors.black54,
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                            ),
                          ],
                        ),
                        const Text(
                          'Project Gallery',
                          style: TextStyle(
                            fontSize: 24,
                            color: primaryColor,
                          ),
                        ),
                        /* Add gallery section*/
                        ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 15,
                          itemBuilder: (BuildContext context, int index) =>
                              Card(
                            child: Center(child: Text('Dummy Card Text')),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        CupertinoButton(
                          child: Text(
                            'Project Progress',
                            style: const TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => const ProgressScreen(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        /* CupertinoButton(
                          child: const Text(
                            'Donate Now',
                            style: const TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => const NumPad(controller: null,),
                              ),
                            );
                          },
                        ),*/
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

//  Row buildStatRow() {}
}
