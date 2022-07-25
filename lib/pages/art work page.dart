import 'package:flutter/material.dart';
import 'package:flutter_play_ground/constants/constant%20functions.dart';
import 'package:flutter_play_ground/constants/constants.dart';
import 'package:flutter_play_ground/custom%20objects/art%20work.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArtWorkPage extends StatefulWidget {
  final ArtWork artWork;
  const ArtWorkPage({Key? key, required this.artWork}) : super(key: key);

  @override
  _ArtWorkPageState createState() => _ArtWorkPageState();
}

class _ArtWorkPageState extends State<ArtWorkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.artWork.title, style: const TextStyle(color: primaryTextColor),),
        backgroundColor: primaryAppBarColor,
        iconTheme: const IconThemeData(color: primaryIconThemeColor),
      ),
      backgroundColor: primaryAppBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/90), child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //image
            Image.network(widget.artWork.networkUrl,),
            //reference
            Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/80), child: Row(
              children: [
                const Text('Reference: ' , style: TextStyle(color: primaryTextColor),),
                TextButton(
                    onPressed: () {
                      //use url launcher to go to site
                      ConstantFunctions.openLink(widget.artWork.referenceSource);
                    },
                    child: const Text('https://www.linktoreference.com', style: TextStyle(color: primaryTextColor),)
                )
              ],
            ),),
            //instagram
            Row(
              children: [
                Expanded(flex: 1 ,child: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/100), child: const FaIcon(FontAwesomeIcons.instagram),)),
                const Expanded(flex:4,child: Text('View the post or if unavaliable a general profile page: ', style: TextStyle(color: primaryTextColor),),),
                Expanded(
                  flex: 1,
                  child: TextButton(
                      onPressed: () {
                        ConstantFunctions.openLink(widget.artWork.instagram);
                      },
                      child: const Text('Insta', style: TextStyle(color: primaryTextColor),)
                  ),
                )
              ],
            ),
            //tiktok
            Row(
              children: [
                Expanded(flex: 1, child: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/100), child: const FaIcon(FontAwesomeIcons.tiktok),)),
                const Expanded(flex: 4, child: Text('View the post or if unavaliable a general profile page: ', style: TextStyle(color: primaryTextColor),)),
                Expanded(
                  flex: 1,
                  child: TextButton(
                      onPressed: () {
                        ConstantFunctions.openLink(widget.artWork.tiktok);
                      },
                      child: const Text('Tiktok', style: TextStyle(color: primaryTextColor),)
                  ),
                )
              ],
            ),
            //youtube
            Row(
              children: [
                Expanded(flex:1, child: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/100), child: const FaIcon(FontAwesomeIcons.youtube),)),
                const Expanded(flex:4 , child: Text('View the post or if unavaliable a general profile page: ', style: TextStyle(color: primaryTextColor),)),
                Expanded(
                  flex: 1,
                  child: TextButton(
                      onPressed: () {
                        ConstantFunctions.openLink(widget.artWork.youtube);
                      },
                      child: const Text('Youtube', style: TextStyle(color: primaryTextColor),)
                  ),
                )
              ],
            ),
            //print on demand
            Row(
              children: [
                Expanded(flex:1 , child: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/100), child: const FaIcon(FontAwesomeIcons.shop),)),
                const Expanded(flex:4 , child: Text('View the post or if unavaliable a general profile page: ', style: TextStyle(color: primaryTextColor),)),
                Expanded(flex: 1, child: TextButton(
                    onPressed: () {
                      ConstantFunctions.openLink(widget.artWork.printOnDemandLink);
                    },
                    child: const Text('Print on demand', style: TextStyle(color: primaryTextColor),)
                ))
              ],
            ),
            Row(
              children: [
                Expanded(flex: 1, child: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/100), child: const FaIcon(FontAwesomeIcons.image),)),
                const Expanded(flex: 4, child: Text('View the post or if unavaliable a general profile page: ', style: TextStyle(color: primaryTextColor),)),
                Expanded(
                  flex: 1,
                  child: TextButton(
                      onPressed: () {
                        ConstantFunctions.openLink(widget.artWork.wallpaper);
                      },
                      child: const Text('Shutter stock', style: TextStyle(color: primaryTextColor),)
                  ),
                )
              ],
            ),
          ],
        ),),
      ),
    );
  }
}
