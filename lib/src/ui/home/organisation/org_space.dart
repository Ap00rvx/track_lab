import 'dart:math';

import 'package:avatar_plus/avatar_plus.dart';
import 'package:avatar_stack/avatar_stack.dart';
import 'package:flutter/material.dart';
import 'package:tracklab/locator.dart';
import 'package:tracklab/src/resources/home/home_repository.dart';

class OrgSpace extends StatefulWidget {
  const OrgSpace({super.key});

  @override
  State<OrgSpace> createState() => _OrgSpaceState();
}

class _OrgSpaceState extends State<OrgSpace> {
  final text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = locator.get<HomeRepository>().user;
    final org = locator.get<HomeRepository>().organization;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 5,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          title: const Text('Your Space'),
          actions: [
            user!.image == null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AvatarPlus(
                      user!.username.toString(),
                      height: 50,
                      width: 50,
                    ),
                  )
                : Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(user.image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              org!.name.toString() + " Space",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 5),
                            const Icon(
                              Icons.verified,
                              color: Colors.green,
                              size: 20,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "${org.projects!.length} Running Projects",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (int i = 0;
                                    i < min(6, org.members!.length);
                                    i++)
                                  Align(
                                    widthFactor: 0.5,
                                    child: AvatarPlus(
                                      org.members![i],
                                      height: 35,
                                      width: 35,
                                    ),
                                  )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: text,
                        decoration: InputDecoration(
                          hintText: "Search for projects",
                          filled: true,
                          fillColor: Colors.grey.shade50,
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Action to open filter functionality
                      },
                      icon: const Icon(Icons.menu_outlined, size: 18),
                      label: const Icon(Icons.filter_alt_outlined, size: 18),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(100, 56),
                        backgroundColor: Colors.grey.shade50, // Button color
                        foregroundColor: Colors.black, // Text and icon color
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Rounded corners
                        ),
                        elevation: 1, // Shadow effect
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
