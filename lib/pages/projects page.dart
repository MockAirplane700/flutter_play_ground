import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_play_ground/constants/constants.dart';
import 'package:flutter_play_ground/custom%20objects/projects.dart';
import 'package:flutter_play_ground/firebase_options.dart';
import 'package:flutter_play_ground/pages/view%20project%20page.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {

   String name = '';
   List<Projects> projects = [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects', style: TextStyle(color: primaryTextColor),),
        elevation: 0,
        iconTheme: const IconThemeData(color: primaryIconThemeColor),
        backgroundColor: primaryAppBarColor,
      ),
      backgroundColor: primaryAppBackgroundColor,
      body: Center(
        child: FutureBuilder(
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'),);
              } else if (snapshot.hasData) {
                return StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('Projects').get().asStream(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      //here we place all the needed data into a an object
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.connectionState == ConnectionState.done || snapshot.connectionState == ConnectionState.active){
                        QuerySnapshot querySnapshot = snapshot.data;
                        for (var element in querySnapshot.docs) {
                          name = element['name'];
                          // String startDate =  element['startDate'];
                          // String endDate =  element['endDate'];
                          // String description = element['description'];
                          // String shortDescription = element['shortDescription'];
                          // String technologiesUsed = element['technologies'];
                          // String url = element['image'];
                          // String websiteUrl =  element['websiteUrl'];
                          projects.add(
                            Projects(
                                name: element['name'], startDate: element['startDate'], endDate: element['endDate'],
                                description: element['description'], shortDescription: element['shortDescription'],
                                technologiesUsed: element['technologies'],
                                url: element['image'], websiteUrl: element['websiteUrl']
                            )
                          );
                        }
                        return Center(
                          child:ListView.builder(
                              itemBuilder: (context,index) {
                                return Card(
                                  child: ListTile(
                                    leading: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/100), child: Image.network(projects[index].url),),
                                    title: Text('Name: ${projects[index].name}', style: const TextStyle(color: primaryTextColor),),
                                    subtitle: Text('Start date: ${projects[index].startDate} , End date: ${projects[index].endDate}', style: const TextStyle(color: primaryTextColor),),
                                    trailing: const Icon(Icons.more_vert_rounded),
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewProject(projects: projects[index])));
                                    },
                                  ),);
                              },
                            itemCount: projects.length,
                          ));
                      }else{
                        return Center(child: Text('Error : ${snapshot.error}'),);
                      }
                    });
              }else{
                return Center(child: Text('No data present ${snapshot.data}'),);
              }
            },
          future: Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
        )
      ),
    );
  }
}
