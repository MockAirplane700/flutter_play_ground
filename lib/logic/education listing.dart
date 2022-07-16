import 'package:flutter_play_ground/custom%20objects/education.dart';

class EducationListing {
  static final List<Education> _list = [
    Education(
    startDate: 'January 2010', endDate: 'November 2015',
    school: 'Goldridge College', type: 'High School, O levels and A and AS level (CAMBRIDGE)',
    networkImage: 'https://media-exp2.licdn.com/dms/image/C510BAQHKJMsM2EG_Cg/company-logo_200_200/0/1519869179508?e=1666224000&v=beta&t=amzMDAE-4JYcqSbHtKiRByKpr0hPNauCh6cgk_NXGCU'
  ),
    Education(
        startDate: 'September 2016', endDate: 'present',
        school: 'University of Manitoba', type: 'Undergraduate degree',
        networkImage: 'https://upload.wikimedia.org/wikipedia/en/thumb/3/35/University-of-manitoba-logo.svg/1920px-University-of-manitoba-logo.svg.png'
    ),
  ];

  static List<Education> getListing() {
    return _list;
  }
}