import 'package:flutter/material.dart';
import 'package:flutter_play_ground/constants/constants.dart';
import 'package:flutter_play_ground/custom%20objects/story.dart';
import 'package:flutter_play_ground/pages/mtha\'s%20world/view%20chapter.dart';
import 'package:flutter_play_ground/widgets/custom%20bottom%20navigation%20bar.dart';
import 'package:flutter_play_ground/widgets/custom%20navigation%20drawer.dart';
import 'package:flutter_play_ground/widgets/custom%20search%20delegate.dart';

class StoryPage extends StatefulWidget {
  final Story story;
  const StoryPage({Key? key, required this.story}) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.story.name, style: const TextStyle(color: primaryTextColor),),
        elevation: 0,
        backgroundColor: primaryAppBarColor,
        iconTheme: const IconThemeData(color: primaryIconThemeColor),
      ),
      backgroundColor: primaryAppBackgroundColor,
      drawer:const CustomNavigationDrawer(),
      bottomNavigationBar: const CustomBottomNavigationBar(selected: 1),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/90), child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/80), child: Image.network(widget.story.image),),
            Row(
              children: [
                Expanded(child: Text('Summary: \n${widget.story.summary}', style: const TextStyle(color: primaryTextColor),)),
              ],
            ),
            const Divider(),
            ExpansionTile(title: const Text('Chapters:', style: TextStyle(color: primaryTextColor),), children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height/2,
                  width:  MediaQuery.of(context).size.height/2,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        child: ListTile(
                          title: Text('Chapter ${index +1}' , style:const  TextStyle(color: primaryTextColor),),
                          leading: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/100), child: Image.network(widget.story.image),),
                          subtitle: Text(widget.story.chapters[index], overflow: TextOverflow.ellipsis,style: const TextStyle(color: primaryTextColor),),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewChapter(chapter: widget.story.chapters[index]) ));
                          },
                        ),
                      );
                    },
                    itemCount: widget.story.chapters.length,
                  )
              ),
            ],),
            const Text('Art work: ' , style: TextStyle(color: primaryTextColor),),
            const Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.height/2,
              width:  MediaQuery.of(context).size.height/2,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                      child: Image.network(widget.story.art[index], width: MediaQuery.of(context).size.width/8,height: MediaQuery.of(context).size.width/8,),
                    ),
                    onTap: () {
                      //open dialog box
                      showDialog(context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Fan art' , style: TextStyle(color: primaryTextColor),),
                              content: Image.network(widget.story.art[index]),
                            );
                          }
                      );
                    },
                  );
                },
                itemCount: widget.story.art.length,
              ),
            ),
          ],
        ),),
      ),
    );
  }
}
