
import 'package:flutter/material.dart';
import 'package:flutter_play_ground/constants/constants.dart';
import 'package:flutter_play_ground/custom%20objects/experience.dart';
import 'package:flutter_play_ground/widgets/custom%20bottom%20navigation%20bar.dart';
import 'package:flutter_play_ground/widgets/custom%20navigation%20drawer.dart';

class ViewExperience extends StatefulWidget {
  final Experience experience;
  const ViewExperience({Key? key, required this.experience}) : super(key: key);

  @override
  _ViewExperienceState createState() => _ViewExperienceState();
}

class _ViewExperienceState extends State<ViewExperience> {
  @override
  Widget build(BuildContext context) {
    Experience experience = widget.experience;
    return Scaffold(
      appBar: AppBar(
        title: Text(experience.name, style: const TextStyle(color: primaryTextColor),),
        backgroundColor: primaryAppBarColor,
        iconTheme: const IconThemeData(color: primaryIconThemeColor),
        elevation: 0,
      ),
      backgroundColor: primaryAppBackgroundColor,
      drawer:const CustomNavigationDrawer(),
      bottomNavigationBar:const CustomBottomNavigationBar(selected: 1),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Row that holds image and text
            Row(
              children: [
                Expanded(child: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/100), child: Image.network(experience.networkUrl),)),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height/60,),
            Text('Position: ${experience.name}', style: const TextStyle(color: primaryTextColor)),
            Text('Start date: ${experience.startDate}, End Date: ${experience.endDate}', style: const TextStyle(color: primaryTextColor),),
            Text('Job type: ${experience.workType}', style: const TextStyle(color: primaryTextColor)),
            Text('Name of the company: ${experience.nameOfCompany}', style: const TextStyle(color: primaryTextColor)),
            SizedBox(height: MediaQuery.of(context).size.height/30,),
            //The card holding the description of roles
            Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/60), child: Card(
              shape: const RoundedRectangleBorder(),
              color: Colors.grey,
              child: Text('Description:\n ${experience.description}', maxLines: 10,style: const TextStyle(color: Colors.black),),
            ),),
          ],
        ),
      ),
    );
  }
}
