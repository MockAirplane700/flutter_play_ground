// Here we take whatever Url the user inputs making our first browser
import 'package:flutter/material.dart';
import 'package:flutter_play_ground/web%20view/Pages/web_view_home.dart';
import 'package:flutter_play_ground/web%20view/web_view_objects_and_constants/webview_constants.dart';

class InputUrl extends StatefulWidget {
  const InputUrl({Key? key}) : super(key: key);

  @override
  State<InputUrl> createState() => _InputUrlState();
}

class _InputUrlState extends State<InputUrl> {
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    String userInput = "";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Web view playground", style: TextStyle(color: webViewPrimaryTextColor),),
        backgroundColor: webViewPrimaryAppBarColor,
        iconTheme: const IconThemeData(color: webViewIconThemeDataColor),
      ),
      backgroundColor: webViewPrimaryBackgroundColor,
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //we build a form here with validation
          Expanded(child: Form(
            key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration:const  InputDecoration(hintText: "Enter URL"),
                    onChanged: (value) {
                      userInput = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Cannot proceed without URL, please enter said url.";
                      } else if (!(value.contains("https:")) ) {
                        return "Error: Please enter a URL, that is something to the format of https://www.google.com";
                      }else{
                        return null;
                      }//end if-else
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Thank you, processing URL", style: TextStyle(color: webViewPrimaryTextColor),))
                          );
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> WebViewHome(url: userInput))
                          );
                        }
                      },
                      child: const Text("Submit", style: TextStyle(color: webViewPrimaryTextColor),)
                  )
                ],
              )
          ))
        ],
      ),),
    );
  }
}
