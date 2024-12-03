// To parse this JSON data, do
//
//     final projectsOfOrganisation = projectsOfOrganisationFromJson(jsonString);

import 'dart:convert';

ProjectsOfOrganisation projectsOfOrganisationFromJson(String str) =>
    ProjectsOfOrganisation.fromJson(json.decode(str));

String projectsOfOrganisationToJson(ProjectsOfOrganisation data) =>
    json.encode(data.toJson());

class ProjectsOfOrganisation {
  List<Project>? projects;

  ProjectsOfOrganisation({
    this.projects,
  });

  factory ProjectsOfOrganisation.fromJson(Map<String, dynamic> json) =>
      ProjectsOfOrganisation(
        projects: List<Project>.from(
            json["projects"].map((x) => Project.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "projects": projects != null
            ? List<dynamic>.from(projects!.map((x) => x.toJson()))
            : null,
      };
}

class Project {
  int? progress;
  List<String>? tasks;
  String? id;
  String? name;
  String? description;
  String? link;
  String? version;
  DateTime? startDate;
  DateTime? endDate;
  String? status;
  String? createdBy;
  String? projectManager;
  List<dynamic>? contributors;
  List<String>? teamMembers;
  String? organizationId;
  int? budget;
  String? priority;
  List<String>? tags;
  List<dynamic>? milestones;
  List<dynamic>? documents;
  List<Comment>? comments;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Project({
    this.progress,
    this.tasks,
    this.id,
    this.name,
    this.description,
    this.link,
    this.version,
    this.startDate,
    this.endDate,
    this.status,
    this.createdBy,
    this.projectManager,
    this.contributors,
    this.teamMembers,
    this.organizationId,
    this.budget,
    this.priority,
    this.tags,
    this.milestones,
    this.documents,
    this.comments,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        progress: json["progress"],
        tasks: json["tasks"] != null
            ? List<String>.from(json["tasks"].map((x) => x))
            : null,
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        link: json["link"],
        version: json["version"],
        startDate: json["startDate"] != null
            ? DateTime.parse(json["startDate"])
            : null,
        endDate:
            json["endDate"] != null ? DateTime.parse(json["endDate"]) : null,
        status: json["status"],
        createdBy: json["createdBy"],
        projectManager: json["projectManager"],
        contributors: json["contributors"] != null
            ? List<dynamic>.from(json["contributors"].map((x) => x))
            : null,
        teamMembers: json["teamMembers"] != null
            ? List<String>.from(json["teamMembers"].map((x) => x))
            : null,
        organizationId: json["organizationId"],
        budget: json["budget"],
        priority: json["priority"],
        tags: json["tags"] != null
            ? List<String>.from(json["tags"].map((x) => x))
            : null,
        milestones: json["milestones"] != null
            ? List<dynamic>.from(json["milestones"].map((x) => x))
            : null,
        documents: json["documents"] != null
            ? List<dynamic>.from(json["documents"].map((x) => x))
            : null,
        comments: json["comments"] != null
            ? List<Comment>.from(
                json["comments"].map((x) => Comment.fromJson(x)))
            : null,
        createdAt: json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : null,
        updatedAt: json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"])
            : null,
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "progress": progress,
        "tasks":
            tasks != null ? List<dynamic>.from(tasks!.map((x) => x)) : null,
        "_id": id,
        "name": name,
        "description": description,
        "link": link,
        "version": version,
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "status": status,
        "createdBy": createdBy,
        "projectManager": projectManager,
        "contributors": contributors != null
            ? List<dynamic>.from(contributors!.map((x) => x))
            : null,
        "teamMembers": teamMembers != null
            ? List<dynamic>.from(teamMembers!.map((x) => x))
            : null,
        "organizationId": organizationId,
        "budget": budget,
        "priority": priority,
        "tags": tags != null ? List<dynamic>.from(tags!.map((x) => x)) : null,
        "milestones": milestones != null
            ? List<dynamic>.from(milestones!.map((x) => x))
            : null,
        "documents": documents != null
            ? List<dynamic>.from(documents!.map((x) => x))
            : null,
        "comments": comments != null
            ? List<dynamic>.from(comments!.map((x) => x.toJson()))
            : null,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Comment {
  String? user;
  String? comment;
  String? id;
  DateTime? createdAt;

  Comment({
    this.user,
    this.comment,
    this.id,
    this.createdAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        user: json["user"],
        comment: json["comment"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "comment": comment,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
      };
}
