import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum ProjectType { individual, team }

enum ProjectCategory { mobile, web, fullStack }

class ProjectLink {
  final String label;
  final String url;
  final IconData icon;

  const ProjectLink({
    required this.label,
    required this.url,
    required this.icon,
  });
}

class ProjectLinks {
  static const playStore = IconData(0xf3ab, fontFamily: 'FontAwesomeBrands', fontPackage: 'font_awesome_flutter');
  static const globe = FontAwesomeIcons.globe;
  static const github = FontAwesomeIcons.github;
  static const userIcon = FontAwesomeIcons.mobileScreen;
  static const vendorIcon = FontAwesomeIcons.store;
  static const adminIcon = FontAwesomeIcons.userShield;
  static const driverIcon = FontAwesomeIcons.truckFast;
}

class Project {
  final String name;
  final String subtitle;
  final String description;
  final ProjectType type;
  final ProjectCategory category;
  final String? role;
  final List<String> technologies;
  final List<String> features;
  final List<ProjectLink> links;
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
    this.links = const [],
    this.imagePath,
    this.userCount,
  });
}
