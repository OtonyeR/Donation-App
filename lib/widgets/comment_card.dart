import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:purple/providers/user_provider.dart';
import 'package:purple/utils/colors.dart';
import 'package:purple/utils/dimensions.dart';
import 'package:purple/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:purple/models/user.dart' as model;

class CommentCard extends StatefulWidget {
  final snap;
  const CommentCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  _CommentCardState createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  int projectComm = 0;

  @override
  void initState() {
    super.initState();
    fetchprojectComm();
  }

  fetchprojectComm() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection('projects')
          .doc(widget.snap['projectId'])
          .collection('comments')
          .get();
      projectComm = snap.docs.length;
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final model.User user = Provider.of<UserProvider>(context).getUser;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 16,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              widget.snap.data()['profilePic'],
            ),
            radius: 18,
          ),
          Column(
            children: [
              Text.rich(
                TextSpan(
                  text: widget.snap.data()['username'],
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, color: Color(0xff652D69)),
                  children: <TextSpan>[
                    TextSpan(
                      text: DateFormat.H().format(
                        widget.snap.data()['datePublished'].toDate(),
                      ),
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
              Text(''),
              Expanded(
                child: TextButton(
                  child: const Text(
                    'Reply',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff652D69),
                    ),
                    textAlign: TextAlign.start,
                  ),
                  onPressed: () {},
                ),
              ),
              IconButton(
                alignment: Alignment.bottomRight,
                onPressed: () {},
                icon: widget.snap['likes'].contains(user.uid)
                    ? Icon(
                        Icons.favorite_rounded,
                        color: Color(0xff652D69),
                        size: 20,
                      )
                    : const Icon(
                        Icons.favorite_border_rounded,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
