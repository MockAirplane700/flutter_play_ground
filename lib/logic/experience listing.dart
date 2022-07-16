import 'package:flutter_play_ground/custom%20objects/experience.dart';

class ExperienceListing{
  String string ='' ;
  static final List<Experience> _list = [
    //Freelance experience
    Experience(networkUrl: 'https://images.squarespace-cdn.com/content/v1/62659d6252acdc0ad96d3ffb/1653111922044-G8D4ZPAVCI97XF02XWCX/unsplash-image-LrxSl4ZxoRs.jpg?format=750w',
        description: '• Supervised, delegated and assigned collaborative tasks to a developer team\n• Discussed and translated a client’s idea into technical, cost effective solution\n• Explained to clients cost effective ways to get their applications up and running as well as  explaining what software technologies were needed ', endDate: 'current', startDate: 'May 2020',
        name: 'Software developer', nameOfCompany: 'Freelance',
        workType: 'Self employed'
    ),
    // cashier
    Experience(networkUrl: 'https://images.squarespace-cdn.com/content/v1/62659d6252acdc0ad96d3ffb/c958bc79-1e23-4da3-a2fe-94cfbd1b04ae/1200px-Winnipeg_Blue_Bombers_Logo.svg.png?format=750w',
        description: ' Counted cash in register drawer to balance register at the beginning and end of shift\n Checked prices for customers and processed items sold by scanning barcodes\n Operated cash register for cash, vouchers and credit card transactions\n Counted the inventory of the stand at the beginning and end of my shift.', endDate: 'September 2019', startDate: 'April 2019',
        name: 'Cashier', nameOfCompany: 'Winnipeg blue bombers',
        workType: 'Part time'
    ),
   //manual laborer
    Experience(networkUrl: 'https://images.squarespace-cdn.com/content/v1/62659d6252acdc0ad96d3ffb/1653112323015-MQ9R6IE6MCXHHKGX8YC1/unsplash-image-fY8Jr4iuPQM.jpg?format=750w',
        description: '• Kept storage areas organized, clean and secure to fully protect company assets\n • Recorded information, shortages and discrepancies in the system to keep records current  and accurate ', endDate: 'August 2018', startDate: 'April 2018',
        name: 'Manual laborer', nameOfCompany: 'Flat lands production',
        workType: 'Part time'
    ),
    //volunteer aalab
    Experience(networkUrl: 'https://images.squarespace-cdn.com/content/v1/62659d6252acdc0ad96d3ffb/1653112769231-NQDD72Y94E3F96IIDYJG/unsplash-image-iVfOFaEghqU.jpg?format=750w',
        description: '• Assisted in the maintenance of the lab robots and other equipment\n• Prepared to participate in the Robo cup 2020',
        endDate: 'April 2020', startDate: 'January 2020',
        name: 'Volunteer', nameOfCompany: 'Autonomous Agents lab - Dept of Computer science, University of Manitoba',
        workType: 'Volunteer'
    ),
    //dishwasher
    Experience(networkUrl: 'https://pbs.twimg.com/profile_images/942819527166971904/lUoVgk70_400x400.jpg',
        description: 'Cleaning dishes and organizing them efficiently for use\n Movement of furniture to set up dining room for cleaning and for events ', endDate: 'September 2019', startDate: 'September 2019',
        name: 'Dishwasher', nameOfCompany: 'University of Manitoba dining services',
        workType: 'Part time'
    ),
    //Science rend
    Experience(networkUrl: 'https://images.squarespace-cdn.com/content/v1/62659d6252acdc0ad96d3ffb/aa4e10b4-fcf2-4fc8-a210-dd8c7fe64a4d/harley-and-team_WEB.jpg?format=750w',
        description: 'Assisted in explaining the procedures in the science booths\n Lead the tour guides with the children and their teachers through out the event\n Assisted in the clean up of the event at the end of the day',
        endDate: 'April 2019', startDate: 'April 2019',
        name: 'Volunteer', nameOfCompany: 'Science rendezvous, University of Manitoba',
        workType: 'Volunteer'
    ),
    //volunteer lab assistant
    Experience(networkUrl: 'https://images.squarespace-cdn.com/content/v1/62659d6252acdc0ad96d3ffb/1653132574115-NMB1JFTMCPKY739O1R21/unsplash-image-gKUC4TMhOiY.jpg?format=750w',
        description: '• Assisted in the cleaning and preparation of lab apparatus for experiments and lessons\n• Explained to prospective students and parents and guardians the capabilities of the school physics and chemistry labs\n• Assisted in maintaining lab apparatus regularly',
        endDate: 'November 2015', startDate: 'January 2011',
        name: 'Volunteer lab assistant', nameOfCompany: 'Goldridge College',
        workType: 'Volunteer'
    ),
    //todo: add high school responsibilities

    //head of tech support
    Experience(networkUrl: 'https://www.hyogoajet.net/wp-content/uploads/2013/12/Technical-Support.jpg',
        description: '• Lead the team in charge of maintaining all technical equipment in the school • Assisted the teaching staff in any technical difficulty they found themselves in • Organized technological use and deployment at school events ',
        endDate: 'November 2015', startDate: 'January 2015',
        name: 'Head of Technical Support', nameOfCompany: 'Goldridge College',
        workType: 'High school responsibility '
    ),
    //head of boys hostel
    //head boy
    //cross country captain
    //Mounde house captain
    //SETA vice captain

  ];
}