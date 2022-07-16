class Experience{
  final String name;
  final String startDate;
  final String endDate;
  final String workType;
  final String description;
  final String networkUrl;
  final String nameOfCompany;

  Experience({
    required this.networkUrl, required this.description, required this.endDate,
    required this.startDate, required this.name, required this.nameOfCompany,
    required this.workType
});
}