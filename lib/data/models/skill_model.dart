import 'package:flutter/material.dart';

class SkillCategory {
  final String name;
  final IconData icon;
  final Color color;
  final List<Skill> skills;

  const SkillCategory({
    required this.name,
    required this.icon,
    required this.color,
    required this.skills,
  });
}

class Skill {
  final String name;
  final double proficiency;
  final String? iconPath;

  const Skill({
    required this.name,
    required this.proficiency,
    this.iconPath,
  });
}
