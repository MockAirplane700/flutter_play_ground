import 'package:flutter/material.dart';
import 'package:flutter_play_ground/constants/constant%20functions.dart';
import 'package:flutter_play_ground/constants/constants.dart';
import 'package:flutter_play_ground/custom%20objects/comic.dart';
import 'package:flutter_play_ground/widgets/custom%20bottom%20navigation%20bar.dart';
import 'package:flutter_play_ground/widgets/custom%20navigation%20drawer.dart';
import 'package:flutter_play_ground/widgets/custom%20search%20delegate.dart';

class ComicPage extends StatefulWidget {
  final Comic comic;

  const ComicPage({Key? key, required this.comic}) : super(key: key);

  @override
  _ComicPageState createState() => _ComicPageState();
}

class _ComicPageState extends State<ComicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.comic.name, style: const TextStyle(color: primaryTextColor),),
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
            Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/80), child: Image.network(widget.comic.image),),
            Row(
              children: [
                Text('Author: ${widget.comic.author}', style: const TextStyle(color: primaryTextColor),),
              ],
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      ConstantFunctions.openLink(widget.comic.variantVideo);
                    },
                    child: const Text('Variant comics video', style: TextStyle(color: primaryTextColor),)
                ),
              ],
            ),
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
                      child: Image.network(widget.comic.fanArt[index], width: MediaQuery.of(context).size.width/8,height: MediaQuery.of(context).size.width/8,),
                    ),
                    onTap: () {
                      //open dialog box
                      showDialog(context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Fan art' , style: TextStyle(color: primaryTextColor),),
                              content: Image.network(widget.comic.fanArt[index]),
                            );
                          }
                      );
                    },
                  );
                },
                itemCount: widget.comic.fanArt.length,
              ),
            ),
          ],
        ),),
      ),
    );
  }
}
