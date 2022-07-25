import 'package:flutter_play_ground/custom%20objects/art%20work.dart';

class ArtWorks{
  static final List<ArtWork> _list = [
    ArtWork(networkUrl: 'https://images.squarespace-cdn.com/content/v1/61d89d480818df529090221b/2353c29f-a946-48fe-b737-9ad5102b5464/1AC3E352-4EFD-4069-955F-9733F31292AE.jpeg?format=500w',
        youtube: 'https://www.youtube.com/channel/UCzSocg5oXlJQzFBm_gagttw/featured',
        instagram: 'https://www.instagram.com/',
        printOnDemandLink: 'https://www.printful.com/',
        referenceSource: 'https://pin.it/4b6so3T',
        tiktok: 'https://www.tiktok.com/@fireplusplus/video/7049701480361708806?is_from_webapp=1&sender_device=pc&web_id=7121017731566847494',
        title: 'Roshack',
        wallpaper: 'https://www.shopify.ca/sell/wallpaper'
    )
  ];

  static List<ArtWork> getWorks() {
    return _list;
  }
}