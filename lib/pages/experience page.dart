import 'package:flutter/material.dart';
import 'package:flutter_play_ground/constants/constants.dart';
import 'package:flutter_play_ground/custom%20objects/experience.dart';
import 'package:flutter_play_ground/logic/experience%20listing.dart';
import 'package:flutter_play_ground/pages/view%20experience.dart';
import 'package:flutter_play_ground/widgets/custom%20bottom%20navigation%20bar.dart';
import 'package:flutter_play_ground/widgets/custom%20navigation%20drawer.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({Key? key}) : super(key: key);

  @override
  _ExperiencePageState createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  final List<Experience> _list = ExperienceListing.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experience', style: TextStyle(color: primaryTextColor),),
        elevation: 0,
        backgroundColor: primaryAppBackgroundColor,
        iconTheme: const IconThemeData(color: primaryIconThemeColor),
      ),
      backgroundColor: primaryAppBackgroundColor,
      bottomNavigationBar:const CustomBottomNavigationBar(selected: 1),
      drawer:const CustomNavigationDrawer(),
      body: Center(
        child: ListView.builder(
            itemBuilder: (context, index) {
              if (_list.isEmpty){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Card(
                child: ListTile(
                  leading: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/100),child:Image.network(_list[index].networkUrl),),
                  title: Text('Position: ${_list[index].name}'),
                  subtitle: Column(children: [
                    Text('Start date: ${_list[index].startDate}, End date ${_list[index].endDate}'),
                    Text('Company Name: ${_list[index].nameOfCompany}')
                  ],),
                  onTap: () {
                    //go to relevant page
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewExperience(experience: _list[index])));
                  },
                ),
              );
            },
          itemCount: _list.length,
        ),
      ),
    );
  }
}

