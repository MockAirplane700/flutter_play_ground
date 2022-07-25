import 'package:flutter/material.dart';
import 'package:flutter_play_ground/constants/constants.dart';

class ViewChapter extends StatefulWidget {
  final String chapter;

  const ViewChapter({Key? key, required this.chapter}) : super(key: key);

  @override
  _ViewChapterState createState() => _ViewChapterState();
}

class _ViewChapterState extends State<ViewChapter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chapter', style: TextStyle(color: primaryTextColor),),
        elevation: 0,
        iconTheme: const IconThemeData(color: primaryIconThemeColor),
        backgroundColor: primaryAppBarColor,
      ),
      backgroundColor: primaryAppBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/30), child: Text(widget.chapter, style: const TextStyle(color: primaryTextColor,),),),
        ),
      ),
    );
  }
}
