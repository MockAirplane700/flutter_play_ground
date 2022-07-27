/// ------------------------------------
///     This page holds a listing of what manga, light novels, comics and tv shows I am watching and reading ( Art work related to it as well as critique),
///     what manga, light novels, comics and tv shows I have already watched (Art work related to it as well as critique),
///     My own stories segregated by worlds and or characters of my own making ( Art work related to it as well as critique )
///
///
/// -------------------------------------
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_play_ground/constants/constants.dart';
import 'package:flutter_play_ground/custom%20objects/Light%20novel.dart';
import 'package:flutter_play_ground/custom%20objects/comic.dart';
import 'package:flutter_play_ground/custom%20objects/manga.dart';
import 'package:flutter_play_ground/custom%20objects/story.dart';
import 'package:flutter_play_ground/firebase_options.dart';
import 'package:flutter_play_ground/pages/mtha\'s%20world/Light%20novel%20page.dart';
import 'package:flutter_play_ground/pages/mtha\'s%20world/comic%20page.dart';
import 'package:flutter_play_ground/pages/mtha\'s%20world/manga%20page.dart';
import 'package:flutter_play_ground/pages/mtha\'s%20world/story%20page.dart';
import 'package:flutter_play_ground/widgets/custom%20bottom%20navigation%20bar.dart';
import 'package:flutter_play_ground/widgets/custom%20navigation%20drawer.dart';
import 'package:flutter_play_ground/widgets/custom%20search%20delegate.dart';

class Home extends StatefulWidget {
  final int selectedIndex;

  const Home({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<Manga> mangaka = [];
    List<Comic> comics = [];
    List<LightNovel> novels = [];
    List<Story> stories = [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(color: primaryTextColor),),
        backgroundColor: primaryAppBarColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: primaryIconThemeColor),
      ),
      backgroundColor: primaryAppBackgroundColor,
      drawer:const CustomNavigationDrawer(),
      bottomNavigationBar:const CustomBottomNavigationBar(selected: 1),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Manga
              const Text('Manga', style: TextStyle(color: primaryTextColor),),
              const Divider(),
              //Future builder -> Streambuilder-> ListView
              SizedBox(
                height: MediaQuery.of(context).size.height/3,
                child:  FutureBuilder(
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'),);
                    } else if (snapshot.hasData) {
                      return StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance.collection('manga').get().asStream(),
                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                            //here we place all the needed data into a an object
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.connectionState == ConnectionState.done || snapshot.connectionState == ConnectionState.active){
                              QuerySnapshot querySnapshot = snapshot.data;
                              for (var element in querySnapshot.docs) {
                                // String startDate =  element['startDate'];
                                // String endDate =  element['endDate'];
                                // String description = element['description'];
                                // String shortDescription = element['shortDescription'];
                                // String technologiesUsed = element['technologies'];
                                // String url = element['image'];
                                // String websiteUrl =  element['websiteUrl'];
                                mangaka.add(
                                    Manga(
                                        image: element['image'], name: element['name'],
                                        author: element['author'], fanArt: element['fanArt']
                                    )
                                );
                              }
                              return Center(
                                  child:ListView.builder(
                                    itemBuilder: (context,index) {
                                      return Card(
                                        child: ListTile(
                                          leading: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/100), child: Image.network(mangaka[index].image),),
                                          title: Text('Name: ${mangaka[index].name}', style: const TextStyle(color: primaryTextColor),),
                                          subtitle: Text('Start date: ${mangaka[index].author}', style: const TextStyle(color: primaryTextColor),),
                                          trailing: const Icon(Icons.more_vert_rounded),
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> MangaPage(manga: mangaka[index])));
                                          },
                                        ),);
                                    },
                                    itemCount: mangaka.length,
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
                ),
              ),
              //Comics
              const Text('Comics', style: TextStyle(color: primaryTextColor),),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.height/3,
                child:  FutureBuilder(
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'),);
                    } else if (snapshot.hasData) {
                      return StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance.collection('comics').get().asStream(),
                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                            //here we place all the needed data into a an object
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.connectionState == ConnectionState.done || snapshot.connectionState == ConnectionState.active){
                              QuerySnapshot querySnapshot = snapshot.data;
                              for (var element in querySnapshot.docs) {
                                // String startDate =  element['startDate'];
                                // String endDate =  element['endDate'];
                                // String description = element['description'];
                                // String shortDescription = element['shortDescription'];
                                // String technologiesUsed = element['technologies'];
                                // String url = element['image'];
                                // String websiteUrl =  element['websiteUrl'];
                                comics.add(
                                   Comic(
                                       author: element['author'], fanArt: element['fanArt'], image: element['image'],
                                       name: element['name'], summary: element['summary'],
                                       variantVideo: element['variantVideo']
                                   )
                                );
                              }
                              return Center(
                                  child:ListView.builder(
                                    itemBuilder: (context,index) {
                                      return Card(
                                        child: ListTile(
                                          leading: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/100), child: Image.network(comics[index].image),),
                                          title: Text('Name: ${comics[index].name}', style: const TextStyle(color: primaryTextColor),),
                                          subtitle: Text('Author: ${comics[index].author}', style: const TextStyle(color: primaryTextColor),),
                                          trailing: const Icon(Icons.more_vert_rounded),
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ComicPage(comic: comics[index])));
                                          },
                                        ),);
                                    },
                                    itemCount: comics.length,
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
                ),
              ),
              //Light novels
              const Text('Light novels', style: TextStyle(color: primaryTextColor),),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.height/3,
                child:  FutureBuilder(
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'),);
                    } else if (snapshot.hasData) {
                      return StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance.collection('lightNovels').get().asStream(),
                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                            //here we place all the needed data into a an object
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.connectionState == ConnectionState.done || snapshot.connectionState == ConnectionState.active){
                              QuerySnapshot querySnapshot = snapshot.data;
                              for (var element in querySnapshot.docs) {
                                // String startDate =  element['startDate'];
                                // String endDate =  element['endDate'];
                                // String description = element['description'];
                                // String shortDescription = element['shortDescription'];
                                // String technologiesUsed = element['technologies'];
                                // String url = element['image'];
                                // String websiteUrl =  element['websiteUrl'];
                                novels.add(
                                    LightNovel(
                                        fanArt: element['fanArt'], summary: element['summary'],
                                        name: element['name'], image: element['image'],
                                        author: element['author']
                                    )
                                );
                              }
                              return Center(
                                  child:ListView.builder(
                                    itemBuilder: (context,index) {
                                      return Card(
                                        child: ListTile(
                                          leading: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/100), child: Image.network(novels[index].image),),
                                          title: Text('Name: ${novels[index].name}', style: const TextStyle(color: primaryTextColor),),
                                          subtitle: Text('Author: ${novels[index].author}', style: const TextStyle(color: primaryTextColor),),
                                          trailing: const Icon(Icons.more_vert_rounded),
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> LightNovelPage(lightNovel: novels[index])));
                                          },
                                        ),);
                                    },
                                    itemCount: novels.length,
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
                ),
              ),
              //My own stories
              const Text('My own stories', style: TextStyle(color: primaryTextColor),),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.height/3,
                child:  FutureBuilder(
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'),);
                    } else if (snapshot.hasData) {
                      return StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance.collection('stories').get().asStream(),
                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                            //here we place all the needed data into a an object
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.connectionState == ConnectionState.done || snapshot.connectionState == ConnectionState.active){
                              QuerySnapshot querySnapshot = snapshot.data;
                              for (var element in querySnapshot.docs) {
                                // String startDate =  element['startDate'];
                                // String endDate =  element['endDate'];
                                // String description = element['description'];
                                // String shortDescription = element['shortDescription'];
                                // String technologiesUsed = element['technologies'];
                                // String url = element['image'];
                                // String websiteUrl =  element['websiteUrl'];
                                stories.add(
                                    Story(
                                        image: element['image'], name: element['name'], summary: element['summary'], art: element['art'],
                                        chapters: element['story']
                                    )
                                );
                              }
                              return Center(
                                  child:ListView.builder(
                                    itemBuilder: (context,index) {
                                      return Card(
                                        child: ListTile(
                                          leading: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/100), child: Image.network(stories[index].image),),
                                          title: Text('Name: ${stories[index].name}', style: const TextStyle(color: primaryTextColor),),
                                          subtitle: Text('Summary: ${stories[index].summary}', style: const TextStyle(color: primaryTextColor),),
                                          trailing: const Icon(Icons.more_vert_rounded),
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> StoryPage(story: stories[index])));
                                          },
                                        ),);
                                    },
                                    itemCount: stories.length,
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
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
