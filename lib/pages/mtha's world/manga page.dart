import 'package:flutter/material.dart';
import 'package:flutter_play_ground/constants/constants.dart';
import 'package:flutter_play_ground/custom%20objects/manga.dart';

class MangaPage extends StatefulWidget {
  final Manga manga;
  const MangaPage({Key? key, required this.manga}) : super(key: key);

  @override
  _MangaPageState createState() => _MangaPageState();
}

class _MangaPageState extends State<MangaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.manga.name, style: const TextStyle(color: primaryTextColor),),
        elevation: 0,
        backgroundColor: primaryAppBarColor,
        iconTheme: const IconThemeData(color: primaryIconThemeColor),
      ),
      backgroundColor: primaryAppBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/90), child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/80), child: Image.network(widget.manga.image),),
            Row(
              children: [
                Text('Author: ${widget.manga.author}', style: const TextStyle(color: primaryTextColor),),
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
                      child: Image.network(widget.manga.fanArt[index], width: MediaQuery.of(context).size.width/8,height: MediaQuery.of(context).size.width/8,),
                    ),
                    onTap: () {
                      //open dialog box
                      showDialog(context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Fan art' , style: TextStyle(color: primaryTextColor),),
                              content: Image.network(widget.manga.fanArt[index]),
                            );
                          }
                      );
                    },
                  );
                },
                itemCount: widget.manga.fanArt.length,
              ),
            ),
          ],
        ),),
      ),
    );
  }
}
