import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:tracklab/src/models/organization_model.dart';
import 'package:tracklab/src/models/projects_model.dart';
import 'package:tracklab/src/models/user_model.dart';
import 'package:tracklab/utils/urls.dart';

class HomeRepository {
  User? user;
  Organization? organization;
  ProjectsOfOrganisation? projectsOfOrganisation;
  Future<User?> getUser(String token) async {
    try {
      final dio = Dio();
      final response = await dio.get(
          AppUrls.BASE_URL + AppUrls.USER + AppUrls.PROFILE,
          options: Options(headers: {'x-auth-token': token}));

      if (kDebugMode) {
        print(response.data["user"]);
      }
      final json = response.data["user"];
      final org = await dio.get(AppUrls.BASE_URL + AppUrls.ORG,
          options: Options(headers: {'id': json["organizationId"]}));
      projectsOfOrganisation = await getProjects(json["organizationId"]);

      final orgJson = org.data["organization"];
      organization = Organization.fromJson(orgJson);

      return user = User.fromJson(json);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  Future<ProjectsOfOrganisation?> getProjects(String id) async {
    print(id);
    try {
      final dio = Dio();
      final url = AppUrls.BASE_URL + AppUrls.ORG + AppUrls.PROJECTS;
      print(url);
      final response =
          await dio.get(url, options: Options(headers: {"orgId": id}));
      if (kDebugMode) {
        print(response.data);
      }
      if (response.statusCode == 200) {
        print(response.data.runtimeType);
        return projectsOfOrganisation =
            ProjectsOfOrganisation.fromJson(response.data);
      } else {
        return null;
      }
    } catch (err) {
      log(err.toString());
      return null;
    }
  }
}
