// The home page for web view tutorial 

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_play_ground/web%20view/web_view_objects_and_constants/webview_constants.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewHome extends StatefulWidget {
  final String url;
  const WebViewHome({Key? key, required this.url}) : super(key: key);

  @override
  State<WebViewHome> createState() => _WebViewHomeState();
}

class _WebViewHomeState extends State<WebViewHome> {

  final _key = UniqueKey();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Web view"),
      ),
      body: Center(
        child: WebView(
          key: _key,
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: widget.url,
        ),
      ),
    );
  }
}
