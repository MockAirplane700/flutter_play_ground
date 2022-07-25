import 'package:flutter/material.dart';
import 'package:flutter_play_ground/constants/constants.dart';
import 'package:flutter_play_ground/custom%20objects/character.dart';

class ViewCharacterPage extends StatefulWidget {
  final Character character;
  
  const ViewCharacterPage({Key? key, required this.character}) : super(key: key);

  @override
  _ViewCharacterPageState createState() => _ViewCharacterPageState();
}

class _ViewCharacterPageState extends State<ViewCharacterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.character.name, style: const TextStyle(color: primaryTextColor),),
        elevation: 0,
        iconTheme: const IconThemeData(color: primaryIconThemeColor),
        backgroundColor: primaryAppBarColor,
      ),
      backgroundColor: primaryAppBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/70), child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/80), child: Image.network(widget.character.image),),
            Text('Name: ${widget.character.name}', style: const TextStyle(color: primaryTextColor),),
            const Divider(),
            Text('Who are they?: \n${widget.character.whotheyare}', style: const TextStyle(color: primaryTextColor),),
            const Divider(),
            Text('How did they come to be? : \n${widget.character.howtheycametobe}', style: const TextStyle(color: primaryTextColor),),
            const Divider(),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width/100),
              child:SizedBox(
                height: MediaQuery.of(context).size.height/1.3,
                width: MediaQuery.of(context).size.width/1.3,
                child:  GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        showDialog(context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content: Image.network(widget.character.references[index],),
                            )
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        child: Image.network(widget.character.references[index]),
                      ),
                    );
                  },
                  itemCount: widget.character.references.length,
                ),
              )
            )


          ],
        ),),
      ),
    );
  }
}
