/*import 'package:flutter/widgets.dart';
import 'package:purple/models/projectsdet.dart';
import 'package:purple/resources/auth_methods.dart';

class ProjectProvider with ChangeNotifier {
  Project? _project;
  final AuthMethods _authMethods = AuthMethods();

  Project get getProject => _project!;

  Future<void> refreshProject() async {
    Project project = await _authMethods.getProjectDetails();
    _project = project;
    notifyListeners();
  }
}  */
