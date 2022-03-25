import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:purple/screens/comment_screen.dart';
import 'package:purple/utils/colors.dart';
import 'package:purple/models/user.dart' as model;
import 'package:purple/providers/user_provider.dart';
import 'package:purple/resources/firestore_methods.dart';
import 'package:provider/provider.dart';
import 'package:purple/models/projectsdet.dart';
import 'package:intl/intl.dart';
import 'package:purple/utils/global_variables.dart';
import 'package:purple/utils/utils.dart';

class ProjectCard extends StatefulWidget {
  final snap;
  const ProjectCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  final Color _favIconColor = primaryColor;
  int commentLen = 0;

  @override
  void initState() {
    super.initState();
    getComments();
  }

  void getComments() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection('projects')
          .doc(widget.snap['projectId'])
          .collection('comments')
          .get();
      commentLen = snap.docs.length;
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    setState(() {});
  }

  deleteProject(String projectId) async {
    try {
      await FireStoreMethods().deleteProject(projectId);
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final model.User user = Provider.of<UserProvider>(context).getUser;
    final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: width > webScreenSize ? secondaryColor : mobileBackgroundColor,
        ),
        color: mobileBackgroundColor,
      ),
      color: mobileBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          //Header of Project
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(11.0),
                  topLeft: Radius.circular(11.0)),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 16,
            ).copyWith(right: 0),
            child: Row(
              children: <Widget>[
                const Icon(Icons.location_pin),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.snap['location'].toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: ListView(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shrinkWrap: true,
                            children: [
                              'Delete',
                              'Report',
                            ]
                                .map(
                                  (e) => InkWell(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 16),
                                      child: Text(e),
                                    ),
                                    onTap: () {
                                      deleteProject(
                                        widget.snap['projectId'].toString(),
                                      );
                                      // remove the dialog box
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.more_horiz_rounded))
              ],
            ),
          ),
          Stack(
            //Image of Project
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.infinity,
                child: Image.network(
                  widget.snap['projectUrl'].toString(),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.4),
                  ),
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: [
                          Text(widget.snap['title'].toString()),
                          Text('by' + widget.snap['username'].toString()),
                          Text(widget.snap['donation'].toString()),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          //Likes and comments
                          Row(
                            children: [
                              IconButton(
                                  icon: const Icon(
                                    Icons.send,
                                    size: 20,
                                  ),
                                  onPressed: () {}),
                              IconButton(
                                icon: const Icon(
                                  CupertinoIcons.chat_bubble_text,
                                  size: 20,
                                ),
                                onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => CommentScreen(
                                      projectId:
                                          widget.snap['projectId'].toString(),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                  icon: widget.snap['likes'].contains(user.uid)
                                      ? Icon(
                                          Icons.favorite_rounded,
                                          color: _favIconColor,
                                          size: 20,
                                        )
                                      : const Icon(
                                          Icons.favorite_border_rounded,
                                        ),
                                  onPressed: () async {
                                    await FireStoreMethods().likeProject(
                                      widget.snap['projectId'].toString(),
                                      user.uid,
                                      widget.snap['likes'],
                                    );
                                  })
                            ],
                          ),
                          CupertinoButton(
                            onPressed: () {},
                            child: const Text(
                              "Learn More",
                              textAlign: TextAlign.center,
                            ),
                            color: const Color(0xff60D8C3),
                            padding: const EdgeInsets.all(30),
                            minSize: 70.0,
                            pressedOpacity: 0.6,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(11)),
                          ),
                          Text(
                            DateFormat.yMMMd()
                                .format(widget.snap['datePublished'].toDate()),
                            style: const TextStyle(
                              color: secondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
