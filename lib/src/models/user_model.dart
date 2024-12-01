// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  dynamic image;
  String? id;
  String? username;
  String? name;
  String? email;
  String? role;
  String? status;
  String? organizationId;
  List<dynamic>? projectIds;
  List<dynamic>? issueAssignedId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  User({
    this.image,
    this.id,
    this.username,
    this.name,
    this.email,
    this.role,
    this.status,
    this.organizationId,
    this.projectIds,
    this.issueAssignedId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        image: json["image"],
        id: json["_id"],
        username: json["username"],
        name: json["name"],
        email: json["email"],
        role: json["role"],
        status: json["status"],
        organizationId: json["organizationId"],
        projectIds: json["projectIds"],
        issueAssignedId: json["issueAssignedId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "_id": id,
        "username": username,
        "name": name,
        "email": email,
        "role": role,
        "status": status,
        "organizationId": organizationId,
        "projectIds": projectIds != null
            ? List<dynamic>.from(projectIds!.map((x) => x))
            : null,
        "issueAssignedId": issueAssignedId != null
            ? List<dynamic>.from(issueAssignedId!.map((x) => x))
            : null,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
