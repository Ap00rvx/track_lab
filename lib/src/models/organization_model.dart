// To parse this JSON data, do
//
//     final organisationResponse = organisationResponseFromJson(jsonString);

import 'dart:convert';

OrganisationResponse organisationResponseFromJson(String str) => OrganisationResponse.fromJson(json.decode(str));

String organisationResponseToJson(OrganisationResponse data) => json.encode(data.toJson());

class OrganisationResponse {
    Organization organization;

    OrganisationResponse({
         required this.organization,
    });

    factory OrganisationResponse.fromJson(Map<String, dynamic> json) => OrganisationResponse(
        organization: Organization.fromJson(json["organization"]),
    );

    Map<String, dynamic> toJson() => {
        "organization": organization.toJson(),
    };
}

class Organization {
    String? id;
    String? name;
    String? description;
    Address? address;
    Contact? contact;
    String? logo;
    List<String>? members;
    List<String>? projects;
    List<String>? admins;
    String? createdBy;
    DateTime? establishedDate;
    String? industry;
    List<String>? tags;

    Organization({
        this.id,
        this.name,
        this.description,
        this.address,
        this.contact,
        this.logo,
        this.members,
        this.projects,
        this.admins,
        this.createdBy,
        this.establishedDate,
        this.industry,
        this.tags,
    });

    factory Organization.fromJson(Map<String, dynamic> json) => Organization(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        address: Address.fromJson(json["address"]),
        contact: Contact.fromJson(json["contact"]),
        logo: json["logo"],
        members: List<String>.from(json["members"].map((x) => x)),
        projects: List<String>.from(json["projects"].map((x) => x)),
        admins: List<String>.from(json["admins"].map((x) => x)),
        createdBy: json["createdBy"],
        establishedDate: DateTime.parse(json["establishedDate"]),
        industry: json["industry"],
        tags: List<String>.from(json["tags"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "address": address?.toJson(),
        "contact": contact?.toJson(),
        "logo": logo,
        "members": members != null ? List<dynamic>.from(members!.map((x) => x)) : null,
        "projects": projects != null ? List<dynamic>.from(projects!.map((x) => x)) : null,
        "admins": admins != null ? List<dynamic>.from(admins!.map((x) => x)) : null,
        "createdBy": createdBy,
        "establishedDate": establishedDate?.toIso8601String(),
        "industry": industry,
        "tags": tags != null ? List<dynamic>.from(tags!.map((x) => x)) : null,
    };
}

class Address {
    String? street;
    String? city;
    String? state;
    String? postalCode;
    String? country;

    Address({
        this.street,
        this.city,
        this.state,
        this.postalCode,
        this.country,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        city: json["city"],
        state: json["state"],
        postalCode: json["postalCode"],
        country: json["country"],
    );

    Map<String, dynamic> toJson() => {
        "street": street,
        "city": city,
        "state": state,
        "postalCode": postalCode,
        "country": country,
    };
}

class Contact {
    String? email;
    String? website;
    String? phone;

    Contact({
        this.email,
        this.website,
        this.phone,
    });

    factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        email: json["email"],
        website: json["website"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "website": website,
        "phone": phone,
    };
}
