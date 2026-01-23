enum ProjectType { individual, team }

enum ProjectCategory { mobile, web, fullStack }

class Project {
  final String name;
  final String subtitle;
  final String description;
  final ProjectType type;
  final ProjectCategory category;
  final String? role;
  final List<String> technologies;
  final List<String> features;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? websiteUrl;
  final String? githubUrl;
  final String? imagePath;
  final String? userCount;

  const Project({
    required this.name,
    required this.subtitle,
    required this.description,
    required this.type,
    required this.category,
    this.role,
    required this.technologies,
    required this.features,
    this.playStoreUrl,
    this.appStoreUrl,
    this.websiteUrl,
    this.githubUrl,
    this.imagePath,
    this.userCount,
  });
}
