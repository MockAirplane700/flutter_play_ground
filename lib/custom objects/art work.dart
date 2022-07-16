class ArtWork {
  final String title;
  final String referenceSource;
  final String networkUrl;
  final String printOnDemandLink;
  final String wallpaper;
  // link to post
  final String instagram;
  // link to video of art work
  final String tiktok;
  // youtube link
  final String youtube;

  ArtWork({
    required this.networkUrl, required this.youtube,
    required this.instagram, required this.printOnDemandLink,
    required this.referenceSource, required this.tiktok,
    required this.title, required this.wallpaper
});
}