import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:purple/screens/feed_screen.dart';
import 'package:purple/screens/new%20project/add_project.dart';
import 'package:purple/screens/profile_screen.dart';
import 'package:purple/screens/search_screen.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const FeedScreen(),
  //const SearchScreen(),
  const ProjectScreen(),
  const Text('notifications'),
  ProfileScreen(
      // uid: FirebaseAuth.instance.currentUser!.uid,
      ),
];
