class Education {
  final String degree;
  final String institution;
  final String university;
  final String location;
  final String graduationDate;
  final String? cgpa;
  final List<String> coursework;
  final String? project;

  const Education({
    required this.degree,
    required this.institution,
    required this.university,
    required this.location,
    required this.graduationDate,
    this.cgpa,
    required this.coursework,
    this.project,
  });
}

class Certification {
  final String name;
  final String institution;
  final String date;
  final List<String> highlights;
  final String? projectUrl;

  const Certification({
    required this.name,
    required this.institution,
    required this.date,
    required this.highlights,
    this.projectUrl,
  });
}
