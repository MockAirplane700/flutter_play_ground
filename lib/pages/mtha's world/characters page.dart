import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_play_ground/constants/constants.dart';
import 'package:flutter_play_ground/custom%20objects/character.dart';
import 'package:flutter_play_ground/firebase_options.dart';
import 'package:flutter_play_ground/pages/mtha\'s%20world/view%20character%20page.dart';
import 'package:flutter_play_ground/widgets/custom%20bottom%20navigation%20bar.dart';
import 'package:flutter_play_ground/widgets/custom%20navigation%20drawer.dart';
import 'package:flutter_play_ground/widgets/custom%20search%20delegate.dart';

class CharactersPage extends StatefulWidget {
  final int selectedIndex;

  const CharactersPage({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  @override
  Widget build(BuildContext context) {
    List<Character> characters = [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters page' , style: TextStyle(color: primaryTextColor),),
        elevation: 0,
        backgroundColor: primaryAppBarColor,
        iconTheme: const IconThemeData(color: primaryIconThemeColor),
      ),
      drawer:const CustomNavigationDrawer(),
      backgroundColor: primaryAppBackgroundColor,
      bottomNavigationBar: const CustomBottomNavigationBar(selected: 2),
      body:FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'),);
          } else if (snapshot.hasData) {
            return StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('characters').get().asStream(),
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
                      characters.add(
                          Character(
                              image: element['image'], name: element['name'], howtheycametobe: element['howtheycametobe'],
                              references: element['references'],
                              whotheyare: element['whotheyare']
                          )
                      );
                    }
                    return Center(
                        child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index ) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewCharacterPage(character: characters[index])));
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                  child: SingleChildScrollView(
                                    child: Column( children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.network(characters[index].image),
                                      ),
                                      Text(characters[index].name, style: const TextStyle(color: primaryTextColor),)
                                    ],),
                                  ),
                                ),
                              );
                            },
                          itemCount: characters.length,
                        )
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
      ),
    );
  }
}
