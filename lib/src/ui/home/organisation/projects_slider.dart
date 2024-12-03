import 'dart:math';

import 'package:avatar_plus/avatar_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tracklab/locator.dart';
import 'package:tracklab/src/resources/home/home_repository.dart';

class ProjectsSlider extends StatefulWidget {
  const ProjectsSlider({super.key});

  @override
  State<ProjectsSlider> createState() => _ProjectsSliderState();
}

class _ProjectsSliderState extends State<ProjectsSlider> {
  //function to convert String  into dd/mm/yyyy format

  String convertDate(DateTime date) {
    final DateTime dateTime = date;
    return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
  }

  @override
  Widget build(BuildContext context) {
    final projects =
        locator.get<HomeRepository>().projectsOfOrganisation!.projects;
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          // height: 350,
          width: 500,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 4,
                  spreadRadius: 4,
                  offset: const Offset(1, 0),
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      projects[index].name!,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 40,
                        width: 100,
                        margin: const EdgeInsets.only(right: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            projects[index].status.toString().toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      projects[index].description!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Start Date: ${convertDate(projects[index].startDate!)}",
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Progress : " + projects[index].progress.toString() + "%",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Team members :",
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        projects[index].teamMembers!.length > 0
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (int i = 0;
                                      i <
                                          min(
                                              6,
                                              projects[index]
                                                  .teamMembers!
                                                  .length);
                                      i++)
                                    Align(
                                      widthFactor: 0.5,
                                      child: AvatarPlus(
                                        projects[index].teamMembers![i],
                                        height: 35,
                                        width: 35,
                                      ),
                                    )
                                ],
                              )
                            : const Text(
                                "No Team Members Specified",
                                style: const TextStyle(),
                              ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AvatarPlus(
                      projects[index].createdBy!,
                      height: 35,
                      width: 35,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                SizedBox(
                    height: projects[index].tags!.isNotEmpty ? 50 : 50,
                    child: projects[index].tags!.isNotEmpty
                        ? ListView.builder(
                            itemBuilder: (context, tagIndex) {
                              return _chip(projects[index].tags![tagIndex]);
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: projects[index].tags!.length,
                          )
                        : const Text(
                            "No Project Tags Specified",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          )),
              ],
            ),
          ),
        );
      },
      itemCount: projects!.length,
    );
  }
}

Widget _chip(String text) {
  return Container(
      height: 20,
      width: 100,
      margin: const EdgeInsets.only(right: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ));
}
