import 'package:flutter/material.dart';
import 'package:flutter_play_ground/constants/constants.dart';
import 'package:flutter_play_ground/custom%20objects/education.dart';
import 'package:flutter_play_ground/logic/education%20listing.dart';
import 'package:flutter_play_ground/widgets/custom%20bottom%20navigation%20bar.dart';
import 'package:flutter_play_ground/widgets/custom%20navigation%20drawer.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({Key? key}) : super(key: key);

  @override
  _EducationPageState createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  final List<Education> _list = EducationListing.getListing();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Education', style: TextStyle(color: primaryTextColor),),
        elevation: 0,
        backgroundColor: primaryAppBarColor,
        iconTheme: const IconThemeData(color: primaryIconThemeColor),
      ),
      backgroundColor: primaryAppBackgroundColor,
      bottomNavigationBar:const CustomBottomNavigationBar(selected: 1),
      drawer:const CustomNavigationDrawer(),
      body: Center(
        child: ListView.builder(
            itemBuilder: (context, index) {
              //if the list is empty
              if (_list.isEmpty) {
                //return appropriate
                return const Center(child: Text('List is empty'),);
              }

              return Card(
                child: ListTile(
                  leading: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/100), child: Image.network(_list[index].networkImage),),
                  title: Text('Type: ${_list[index].type}'),
                  subtitle: Column(children: [
                    Text('School: ${_list[index].school}'),
                    Text('Start Date: ${_list[index].startDate} , End date: ${_list[index].endDate}'),
                  ],),
                ),
              );
            },
          itemCount: _list.length,
        ),
      ),
    );
  }
}
