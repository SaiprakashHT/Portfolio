class Experience {
  final String company;
  final String position;
  final String location;
  final String duration;
  final String startDate;
  final String? endDate;
  final bool isCurrent;
  final List<String> responsibilities;
  final List<String> technologies;

  const Experience({
    required this.company,
    required this.position,
    required this.location,
    required this.duration,
    required this.startDate,
    this.endDate,
    this.isCurrent = false,
    required this.responsibilities,
    required this.technologies,
  });
}
