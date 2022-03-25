import 'package:cloud_firestore/cloud_firestore.dart';

class Project {
  final String title;
  final String uid;
  final String username;
  final saves;
  final likes;
  final shares;
  final String projectId;
  final String category;
  final GeoPoint location;
  final String donation;
  final String description;
  final String images;
  final String projectUrl;
  final datePublished;

  const Project({
    required this.title,
    required this.username,
    required this.category,
    required this.description,
    required this.donation,
    required this.images,
    required this.location,
    required this.uid,
    required this.datePublished,
    required this.likes,
    required this.projectId,
    required this.projectUrl,
    required this.saves,
    required this.shares,
  });

  static Project fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Project(
      description: snapshot["description"],
      uid: snapshot["uid"],
      likes: snapshot["likes"],
      projectId: snapshot["projectId"],
      datePublished: snapshot["datePublished"],
      username: snapshot["username"],
      projectUrl: snapshot['projectUrl'],
      images: snapshot['Images'],
      category: snapshot['category'],
      shares: snapshot['shares'],
      donation: snapshot['donation'],
      title: snapshot['title'],
      saves: snapshot['saves'],
      location: snapshot['location'],
    );
  }

  Map<String, dynamic> toJson() => {
        "description": description,
        "uid": uid,
        "likes": likes,
        "username": username,
        "projectId": projectId,
        "datePublished": datePublished,
        'projectUrl': projectUrl,
        'images': images,
        'category': category,
        'shares': shares,
        'donation': donation,
        'title': title,
        'saves': saves,
        'location': location,
      };
}
