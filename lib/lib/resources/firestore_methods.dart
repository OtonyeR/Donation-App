import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:purple/models/projectsdet.dart';
import 'package:purple/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //upload project
  Future<String> uploadPrject(
    String description,
    Uint8List file,
    String uid,
    String title,
    String username,
    String category,
    String donation,
    String images,
    String projectId,
    String projectUrl,
    GeoPoint location,
  ) async {
    String res = "Some error occurred";
    try {
      String projectUrl =
          await StorageMethods().uploadImageToStorage('posts', file, true);

      String projectId = const Uuid().v1(); // creates unique id based on time
      Project project = Project(
          title: title,
          username: username,
          category: category,
          description: description,
          donation: donation,
          images: images,
          location: location,
          uid: uid,
          datePublished: DateTime.now(),
          likes: [],
          projectId: projectId,
          projectUrl: projectUrl,
          saves: [],
          shares: []);

      _firestore.collection('projects').doc(projectId).set(
            project.toJson(),
          );
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> likeProject(String projectId, String uid, List likes) async {
    String res = "Some error occurred";
    try {
      if (likes.contains(uid)) {
        // if the likes list contains the user uid, we need to remove it
        _firestore.collection('projects').doc(projectId).update({
          'likes': FieldValue.arrayRemove([uid])
        });
      } else {
        // else we need to add uid to the likes array
        _firestore.collection('projects').doc(projectId).update({
          'likes': FieldValue.arrayUnion([uid])
        });
      }
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

//Comments

  Future<String> postComment(String projectId, String text, String uid,
      String name, String profilePic) async {
    String res = "Some error occurred";
    try {
      if (text.isNotEmpty) {
        // if the likes list contains the user uid, we need to remove it
        String commentId = const Uuid().v1();
        _firestore
            .collection('projects')
            .doc(projectId)
            .collection('comments')
            .doc(commentId)
            .set({
          'profilePic': profilePic,
          'name': name,
          'uid': uid,
          'text': text,
          'commentId': commentId,
          'datePublished': DateTime.now(),
        });
        res = 'success';
      } else {
        res = "Please enter text";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Delete a project
  Future<String> deleteProject(String projectId) async {
    String res = "Some error occurred";
    try {
      await _firestore.collection('projects').doc(projectId).delete();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
