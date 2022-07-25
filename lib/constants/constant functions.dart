import 'package:url_launcher/url_launcher.dart';

class ConstantFunctions {
  
  static Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url, mode: LaunchMode.externalApplication
    )) {
      throw 'Could not launch $url';
    }
  }
  
  static void openLink(String url) {
    _launchInBrowser(Uri.parse(url));
  }

}