import 'package:flutter/material.dart';
import 'package:flutter_play_ground/constants/constants.dart';
import 'package:flutter_play_ground/custom%20objects/projects.dart';

class ViewProject extends StatefulWidget {
  final Projects projects;
  const ViewProject({Key? key, required this.projects}) : super(key: key);

  @override
  _ViewProjectState createState() => _ViewProjectState();
}

class _ViewProjectState extends State<ViewProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.projects.name, style: const TextStyle(color: primaryTextColor),),
        backgroundColor: primaryAppBarColor,
        iconTheme: const IconThemeData(color: primaryIconThemeColor),
        elevation: 0,
      ),
      backgroundColor: primaryAppBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/100),child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // image of the project
            Padding(padding:  EdgeInsets.all(MediaQuery.of(context).size.width/60), child: Image.network(widget.projects.url,),),
            //Name and date and short description
            Row(
              children: [
                Expanded(
                  child: Padding(padding:EdgeInsets.all(MediaQuery.of(context).size.width/60), 
                    child: Text('Start date: ${widget.projects.startDate} , End date: ${widget.projects.endDate} \n${widget.projects.shortDescription}', ),),
                ),
              ],
            ),
            //Card with grey background with description and technologies
            Padding(padding:  EdgeInsets.all(MediaQuery.of(context).size.width/30), 
              child: Card(
                shape: const RoundedRectangleBorder(),
                color: Colors.grey,
                child: Text('Description: \n ${widget.projects.description} , \n\n\nFrameworks and languages: \n ${widget.projects.technologiesUsed}', style: const TextStyle(color: primaryTextColor),),
              ),),
            //Visit project page
            Row(
              children: [
                Expanded(child: IconButton(
                    onPressed: () {
                      // access the url launcher
                    },
                    icon: const Icon(Icons.wifi_tethering)
                ))
              ],
            )
          ],
        ),),
      ),
    );
  }
}
