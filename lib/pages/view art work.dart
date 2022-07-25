import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_play_ground/constants/constants.dart';
import 'package:flutter_play_ground/custom%20objects/art%20work.dart';
import 'package:flutter_play_ground/firebase_options.dart';
import 'package:flutter_play_ground/pages/art%20work%20page.dart';

class ViewArtWorks extends StatefulWidget {
  const ViewArtWorks({Key? key}) : super(key: key);

  @override
  _ViewArtWorksState createState() => _ViewArtWorksState();
}

class _ViewArtWorksState extends State<ViewArtWorks> {

  @override
  Widget build(BuildContext context) {
    List<ArtWork> artWorks = [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Art work', style: TextStyle(color: primaryTextColor),),
        elevation: 0,
        backgroundColor: primaryAppBarColor,
        iconTheme: const IconThemeData(color: primaryIconThemeColor),
      ),
      backgroundColor: primaryAppBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Circle avatar
            CircleAvatar(
              radius: MediaQuery.of(context).size.width/5,
              backgroundImage: const NetworkImage('https://mcdn.wallpapersafari.com/medium/19/5/X6rY4s.jpg'),
            ),
            //grid
            FutureBuilder(
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'),);
                } else if (snapshot.hasData) {
                  return StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('Artwork').get().asStream(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        //here we place all the needed data into a an object
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.connectionState == ConnectionState.done || snapshot.connectionState == ConnectionState.active){
                          QuerySnapshot querySnapshot = snapshot.data;
                          for (var element in querySnapshot.docs) {
                            String networkUrl =  element['image'];
                            String youtube = element['youtube'];
                            String instagram = element['instagram'];
                            String printOnDemandLink = element['printOnDemand'];
                            String referenceSource = element['reference'];
                            // String tiktok = element['tiktok'];
                            String title =  element['title'];
                            String wallpaper =  element['wallpaper'];
                            artWorks.add(
                              ArtWork(
                                  networkUrl: element['image'], youtube: element['youtube'],
                                  instagram: element['instagram'], printOnDemandLink: element['printOnDemand'],
                                  referenceSource: element['reference'],
                                  tiktok: '', title: element['title'],
                                  wallpaper: element['wallpaper']
                              )
                            );
                          }
                          return SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: GridView.builder(
                                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                  mainAxisSpacing: 2,
                                ),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ArtWorkPage(artWork: artWorks[index])));
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15)
                                      ),
                                      child: Image.network(artWorks[index].networkUrl),
                                    ),
                                  );
                                },
                              itemCount: artWorks.length,
                            ),
                          );
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

          ],
        ),
      ),
    );
  }
}
