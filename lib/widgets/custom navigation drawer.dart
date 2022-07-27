import 'package:flutter/material.dart';
import 'package:flutter_play_ground/constants/constant%20functions.dart';
import 'package:flutter_play_ground/constants/constants.dart';
import 'package:flutter_play_ground/pages/education%20page.dart';
import 'package:flutter_play_ground/pages/experience%20page.dart';
import 'package:flutter_play_ground/pages/view%20art%20work.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNavigationDrawer extends StatefulWidget {

  const CustomNavigationDrawer({Key? key}) : super(key: key);

  @override
  _CustomNavigationDrawerState createState() => _CustomNavigationDrawerState();
}

class _CustomNavigationDrawerState extends State<CustomNavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
           DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white
            ),
              child: CircleAvatar(child: Image.network('https://firebasestorage.googleapis.com/v0/b/mtha-s-world.appspot.com/o/1141aa53ada846b2bf9781f149e862fe.png?alt=media&token=f62ce2c3-e3cc-4b27-b22e-38b15665cb9b'),),

          ),
          ListTile(
            title: const Text('Education', style: TextStyle(color: primaryTextColor),),
            leading: const FaIcon(FontAwesomeIcons.graduationCap),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const EducationPage()));
              // Navigator.pop(context, '');
            },
          ),
          ListTile(
            title: const Text('Experience', style: TextStyle(color: primaryTextColor),),
            leading: const FaIcon(FontAwesomeIcons.briefcase),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const ExperiencePage()));
              // Navigator.pop(context, '');
            },
          ),
          ListTile(
            title: const Text('Art work', style: TextStyle(color: primaryTextColor),),
            leading: const FaIcon(FontAwesomeIcons.masksTheater),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const ViewArtWorks()));
              // Navigator.pop(context, '');
            },
          ),
          ListTile(
            title: const Text('Visit my website', style: TextStyle(color: primaryTextColor),),
            leading: const FaIcon(FontAwesomeIcons.globe),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              ConstantFunctions.openLink(website);
              // Navigator.pop(context, '');
            },
          ),
          ListTile(
            title: const Text('Visit my Esty store', style: TextStyle(color: primaryTextColor),),
            leading: const FaIcon(FontAwesomeIcons.etsy),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              ConstantFunctions.openLink(etsy);
              // Navigator.pop(context, '');
            },
          ),
          ListTile(
            title: const Text('Visit my youtube channel', style: TextStyle(color: primaryTextColor),),
            leading: const FaIcon(FontAwesomeIcons.youtube),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              ConstantFunctions.openLink(youtube);
              // Navigator.pop(context, '');
            },
          ),
          ListTile(
            title: const Text('Visit my tiktok', style: TextStyle(color: primaryTextColor),),
            leading: const FaIcon(FontAwesomeIcons.tiktok),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              ConstantFunctions.openLink(tiktok);
              // Navigator.pop(context, '');
            },
          ),
          ListTile(
            title: const Text('Visit my instagram', style: TextStyle(color: primaryTextColor),),
            leading: const FaIcon(FontAwesomeIcons.instagram),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              ConstantFunctions.openLink(instagram);
              // Navigator.pop(context, '');
            },
          ),
          ListTile(
            title: const Text('Visit my github profile', style: TextStyle(color: primaryTextColor),),
            leading: const FaIcon(FontAwesomeIcons.github),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              ConstantFunctions.openLink(github);
              // Navigator.pop(context, '');
            },
          ),
          ListTile(
            title: const Text('Visit my LinkedIn ', style: TextStyle(color: primaryTextColor),),
            leading: const FaIcon(FontAwesomeIcons.linkedin),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              ConstantFunctions.openLink(linkedIn);
              // Navigator.pop(context, '');
            },
          ),

        ],
      ),
    );
  }
}
