import 'package:flutter_play_ground/custom%20objects/projects.dart';

class ProjectsListing {
  static final List<Projects> _list = [
    //consumer delivery
    Projects(name: 'Consumer delivery',
      startDate: 'May 2022', endDate: 'June 2022',
        description: 'An application that allows me to place an order for a needed item and just pick it up on my way home, perfect for small local businesses who cannot compete with the likes of Walmart and the rest. This application will be simple in nature, meaning all it will do is allow the user to place an order at local Winnipeg stores or at a very specific Winnipeg local store and just come pick it up on my way home.',
      shortDescription: 'An application that allows me to place an order for a needed item and just pick it up on my way home,',
        technologiesUsed: 'Flutter Framework, Object Oriented Programming (OOP), Dart', url: 'https://is3-ssl.mzstatic.com/image/thumb/Purple112/v4/58/d9/6b/58d96b0e-1ec3-e967-94d7-2da5222eecc7/AppIcon-1x_U007emarketing-0-10-0-85-220.png/230x0w.webp',
    ),
    //coupons are us
    //Flask server
    //Marker repository
    //Recipes and inventory
    //Tiffin delivery application
    //Music application
    //Realty application
    //Affiliate marketing application
    //Women's safety application
    // the citadel library platform
    // fire++
    //online store inventory and analytics
  ];

  static List<Projects> getProjects() {
    return _list;
  }
}