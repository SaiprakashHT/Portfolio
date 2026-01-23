import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/skill_model.dart';
import '../models/experience_model.dart';
import '../models/project_model.dart';
import '../models/education_model.dart';
import '../../core/theme/app_colors.dart';

class PortfolioData {
  PortfolioData._();

  // Professional Summary
  static const String professionalSummary = '''
Results-driven Full Stack Flutter Developer with 2+ years of experience specializing in mobile and web application development. Demonstrated expertise in building 10+ production-ready mobile applications using Flutter and developing 3+ web applications using Laravel.

Proficient in end-to-end software development lifecycle, from architecture design to deployment and maintenance. Strong track record of delivering scalable solutions with clean code practices, RESTful API integration, Firebase Cloud Messaging, real-time data synchronization, and optimized UI/UX.

Experienced in Agile methodologies, code reviews, cross-functional collaboration, and team leadership for technical projects.''';

  // Statistics
  static const List<Map<String, String>> stats = [
    {'value': '2+', 'label': 'Years Experience'},
    {'value': '10+', 'label': 'Mobile Apps'},
    {'value': '3+', 'label': 'Web Apps'},
    {'value': '10K+', 'label': 'Active Users'},
  ];

  // Skill Categories
  static final List<SkillCategory> skillCategories = [
    SkillCategory(
      name: 'Mobile Development',
      icon: FontAwesomeIcons.mobileScreen,
      color: AppColors.flutterColor,
      skills: const [
        Skill(name: 'Flutter', proficiency: 0.95),
        Skill(name: 'Dart', proficiency: 0.95),
        Skill(name: 'GetX', proficiency: 0.90),
        Skill(name: 'Provider', proficiency: 0.85),
        Skill(name: 'Bloc Pattern', proficiency: 0.80),
        Skill(name: 'Firebase FCM', proficiency: 0.90),
        Skill(name: 'SQLite', proficiency: 0.85),
        Skill(name: 'React Native', proficiency: 0.70),
      ],
    ),
    SkillCategory(
      name: 'Frontend Development',
      icon: FontAwesomeIcons.code,
      color: AppColors.reactColor,
      skills: const [
        Skill(name: 'React.js', proficiency: 0.75),
        Skill(name: 'JavaScript', proficiency: 0.80),
        Skill(name: 'HTML5', proficiency: 0.90),
        Skill(name: 'CSS3', proficiency: 0.85),
        Skill(name: 'Bootstrap', proficiency: 0.85),
        Skill(name: 'Tailwind CSS', proficiency: 0.80),
      ],
    ),
    SkillCategory(
      name: 'Backend Development',
      icon: FontAwesomeIcons.server,
      color: AppColors.laravelColor,
      skills: const [
        Skill(name: 'Laravel', proficiency: 0.90),
        Skill(name: 'PHP', proficiency: 0.85),
        Skill(name: 'Node.js', proficiency: 0.75),
        Skill(name: 'Express.js', proficiency: 0.75),
        Skill(name: 'Spring Boot', proficiency: 0.70),
        Skill(name: 'RESTful APIs', proficiency: 0.95),
        Skill(name: 'WebSocket', proficiency: 0.80),
      ],
    ),
    SkillCategory(
      name: 'Database',
      icon: FontAwesomeIcons.database,
      color: AppColors.mysqlColor,
      skills: const [
        Skill(name: 'MySQL', proficiency: 0.90),
        Skill(name: 'MongoDB', proficiency: 0.75),
        Skill(name: 'PostgreSQL', proficiency: 0.70),
        Skill(name: 'SQLite', proficiency: 0.85),
        Skill(name: 'Redis', proficiency: 0.70),
      ],
    ),
    SkillCategory(
      name: 'Cloud & Integration',
      icon: FontAwesomeIcons.cloud,
      color: AppColors.firebaseColor,
      skills: const [
        Skill(name: 'Firebase', proficiency: 0.90),
        Skill(name: 'Google Cloud', proficiency: 0.75),
        Skill(name: 'Google Maps API', proficiency: 0.85),
        Skill(name: 'Razorpay', proficiency: 0.85),
        Skill(name: 'Stripe', proficiency: 0.80),
      ],
    ),
    SkillCategory(
      name: 'Tools & Methodologies',
      icon: FontAwesomeIcons.screwdriverWrench,
      color: AppColors.gitColor,
      skills: const [
        Skill(name: 'Git', proficiency: 0.90),
        Skill(name: 'GitHub', proficiency: 0.90),
        Skill(name: 'VS Code', proficiency: 0.95),
        Skill(name: 'Android Studio', proficiency: 0.90),
        Skill(name: 'Postman', proficiency: 0.85),
        Skill(name: 'Agile/Scrum', proficiency: 0.85),
        Skill(name: 'CI/CD', proficiency: 0.75),
      ],
    ),
  ];

  // Experience
  static const List<Experience> experiences = [
    Experience(
      company: 'Techland IT Solutions',
      position: 'Software Developer',
      location: 'Hyderabad, Telangana',
      duration: 'Nov 2024 - Present',
      startDate: 'Nov 2024',
      isCurrent: true,
      responsibilities: [
        'Engineered and deployed 7 production-ready mobile applications (SalesPulse, MiRoute, Boutique Dekho, Go Car Wash, Cash-EX, MyDeal, VNews) using Flutter and Laravel, serving 10,000+ active users with 99.5% uptime',
        'Architected and developed 3 full-stack web applications using Laravel with MySQL databases, implementing MVC architecture patterns and RESTful API design principles',
        'Designed and implemented secure RESTful APIs for seamless mobile-to-backend communication with Laravel Sanctum authentication, role-based access control (RBAC), and JWT token management',
        'Integrated Firebase Cloud Messaging (FCM) for push notifications across all mobile applications, achieving 95% notification delivery rate and improving user engagement by 40%',
        'Implemented real-time in-app messaging systems using WebSocket connections for customer-vendor communication, reducing response time by 60%',
        'Built reusable component libraries and implemented GetX state management pattern, reducing code redundancy by 40% and improving application maintainability',
        'Optimized application performance through code refactoring, lazy loading, caching strategies, and database query optimization, improving load times by 35% and reducing API response time by 45%',
        'Conducted comprehensive code reviews and implemented automated testing pipelines using Git CI/CD, reducing production bugs by 30%',
      ],
      technologies: [
        'Flutter',
        'Laravel',
        'MySQL',
        'Firebase',
        'GetX',
        'WebSocket',
        'REST APIs',
        'Git',
      ],
    ),
    Experience(
      company: 'Maninfini Automations Private Limited',
      position: 'Junior Software Developer',
      location: 'Bangalore, Karnataka',
      duration: 'Oct 2023 - Oct 2024',
      startDate: 'Oct 2023',
      endDate: 'Oct 2024',
      isCurrent: false,
      responsibilities: [
        'Developed 3+ mobile applications and web platforms, streamlining business processes and improving operational efficiency by 25% through automation and digital transformation',
        'Collaborated with product teams to gather requirements, design technical solutions, and deliver software meeting client specifications within tight deadlines',
        'Implemented responsive UI designs using Flutter and integrated third-party APIs for payment gateways, Google Maps geolocation, and push notification services',
        'Participated in Agile ceremonies including daily standups, sprint planning, and retrospectives to ensure project deliverables were met on time',
        'Performed debugging, testing, and performance optimization to ensure high-quality, scalable software solutions with comprehensive unit and integration testing',
      ],
      technologies: [
        'Flutter',
        'Dart',
        'REST APIs',
        'Firebase',
        'Google Maps',
        'Payment Integration',
      ],
    ),
  ];

  // Projects
  static const List<Project> projects = [
    Project(
      name: 'SalesPulse',
      subtitle: 'Mobile CRM Application',
      description:
          'Comprehensive CRM mobile application for managing sales pipelines, leads, customer interactions, and real-time analytics dashboard with 5,000+ active users.',
      type: ProjectType.individual,
      category: ProjectCategory.fullStack,
      technologies: [
        'Flutter',
        'Laravel',
        'MySQL',
        'RESTful APIs',
        'GetX',
        'Firebase FCM',
        'SQLite',
        'WebSocket',
      ],
      features: [
        'Role-based access control (Admin, Manager, Sales Rep)',
        'Offline mode with local SQLite database',
        'Real-time chat system with WebSocket',
        'Lead scoring algorithm and customer interaction timeline',
        'Interactive charts for sales performance tracking',
        'Phone call, email, and Google Maps integration',
      ],
      userCount: '5,000+',
    ),
    Project(
      name: 'MiRoute',
      subtitle: 'Logistics & Rider Management',
      description:
          'Comprehensive route optimization application with separate mobile app for riders and web-based admin panel for fleet management and real-time operations monitoring.',
      type: ProjectType.individual,
      category: ProjectCategory.fullStack,
      technologies: [
        'Flutter',
        'Laravel',
        'MySQL',
        'Google Maps API',
        'WebSocket',
        'Firebase FCM',
      ],
      features: [
        'Real-time GPS tracking with polyline route display',
        'Geofencing alerts for zone entry/exit',
        'Automated route optimization reducing delivery time by 30%',
        'Live location updates every 10 seconds',
        'Comprehensive rider performance metrics',
        'Admin dashboard for fleet management',
      ],
    ),
    Project(
      name: 'Boutique Dekho',
      subtitle: 'Multi-Platform E-Commerce Solution',
      description:
          'Complete e-commerce ecosystem with Customer Mobile App, Vendor Mobile App, and Admin Web Panel for boutique marketplace operations serving 3,000+ users.',
      type: ProjectType.team,
      category: ProjectCategory.fullStack,
      role: 'Lead Developer',
      technologies: [
        'Flutter',
        'Laravel',
        'MySQL',
        'RESTful APIs',
        'Razorpay',
        'Paytm',
        'Firebase FCM',
        'WebSocket',
      ],
      features: [
        'Multiple payment options (Razorpay, Paytm, COD)',
        'Real-time customer-vendor chat system',
        'Inventory management with low stock alerts',
        'Order processing with automated invoice generation',
        'Vendor dashboard with sales analytics',
      ],
      userCount: '3,000+',
    ),
    Project(
      name: 'Go Car Wash',
      subtitle: 'On-Demand Service Platform',
      description:
          'On-demand service platform with Customer Mobile App, Service Provider Mobile App, and Admin Web Portal for car wash booking and management with 2,500+ active users.',
      type: ProjectType.team,
      category: ProjectCategory.fullStack,
      role: 'Backend Lead',
      technologies: [
        'Flutter',
        'React.js',
        'Laravel',
        'MySQL',
        'Stripe',
        'Razorpay',
        'Google Maps',
        'Firebase FCM',
        'WebSocket',
      ],
      features: [
        'Real-time availability calendar with slot-based booking',
        'Smart provider matching based on location and ratings',
        'Stripe and Razorpay payment integration',
        'WebSocket-based real-time chat',
        '5-star rating and review system',
        'Multi-language support (English, Hindi, Telugu)',
      ],
      userCount: '2,500+',
    ),
    Project(
      name: 'Cash-EX',
      subtitle: 'Digital Canteen & Stationary Management',
      description:
          'Complete digital ecosystem for college canteens and stationary shops with Student Mobile App, Vendor Mobile App, Web Portal, and Admin Panel serving 1,200+ students.',
      type: ProjectType.individual,
      category: ProjectCategory.fullStack,
      technologies: [
        'Flutter',
        'Laravel',
        'MySQL',
        'JavaScript',
        'HTML5',
        'CSS3',
        'QR Code',
        'Payment Integration',
      ],
      features: [
        'Digital wallet with QR code-based payments',
        'Advance order placement with scheduled pickup',
        'Real-time inventory management',
        'Analytics dashboard with sales reports',
        'Biometric authentication support',
      ],
      userCount: '1,200+',
    ),
    Project(
      name: 'MyDeal',
      subtitle: 'Deals & Offers Platform',
      description:
          'Mobile application for discovering and sharing promotional offers and deals from local businesses and online retailers with 4,000+ active users and 10,000+ deals listed.',
      type: ProjectType.individual,
      category: ProjectCategory.fullStack,
      technologies: [
        'Flutter',
        'Spring Boot',
        'RESTful APIs',
        'MySQL',
        'Google Maps API',
        'Firebase FCM',
        'Redis',
      ],
      features: [
        'Location-based deal discovery with configurable radius',
        'Personalized recommendations using collaborative filtering',
        'Time-limited offers with countdown timers',
        'Redis caching reducing response time by 60%',
        'Coupon code management with auto-apply',
      ],
      userCount: '4,000+',
    ),
    Project(
      name: 'VNews',
      subtitle: 'News Aggregation Application',
      description:
          'Comprehensive news application aggregating content from multiple sources with real-time updates, personalization, and offline reading capabilities serving 6,000+ users.',
      type: ProjectType.team,
      category: ProjectCategory.mobile,
      role: 'Mobile Developer',
      technologies: [
        'Flutter',
        'Laravel',
        'News APIs',
        'Firebase FCM',
        'SQLite',
        'Text-to-Speech',
      ],
      features: [
        'Multiple news API integration (NewsAPI.org, Google News)',
        '15+ news categories with customizable preferences',
        'Breaking news push notifications',
        'Offline reading with bookmark synchronization',
        'Text-to-speech for hands-free reading',
        'Dark/light mode themes',
      ],
      userCount: '6,000+',
    ),
    Project(
      name: 'SportsinU',
      subtitle: 'Basketball Tournament Management',
      description:
          'Professional tournament management platform for organizing basketball events with comprehensive team management, scheduling system, live scoring interface, and tournament bracket generation.',
      type: ProjectType.team,
      category: ProjectCategory.fullStack,
      role: 'Full Stack Developer',
      technologies: [
        'React Native',
        'Node.js',
        'JavaScript',
        'MySQL',
        'Socket.io',
        'Payment Integration',
      ],
      features: [
        'Team registration with player roster management',
        'Automated schedule generation algorithm',
        'Real-time score tracking using Socket.io',
        'Dynamic bracket generation for elimination formats',
        'Registration fee payment integration',
      ],
    ),
    Project(
      name: 'Aaram Feed',
      subtitle: 'E-Commerce Website',
      description:
          'Full-featured e-commerce website for animal feed products with product catalog management, shopping cart functionality, secure payment processing, and order management.',
      type: ProjectType.individual,
      category: ProjectCategory.web,
      technologies: [
        'WordPress',
        'WooCommerce',
        'MySQL',
        'Payment Gateway',
        'SEO',
      ],
      features: [
        'Product categories with custom attributes',
        'Multiple payment gateways (Razorpay, PayPal, COD)',
        'Automated order confirmation with invoice PDF',
        'Shipping integration with tracking',
        'Return/refund management workflow',
      ],
    ),
  ];

  // Education
  static const Education education = Education(
    degree: 'Bachelor of Engineering in Mechanical Engineering',
    institution: 'Sri Krishna Institute of Technology',
    university: 'Visvesvaraya Technological University (VTU)',
    location: 'Bangalore',
    graduationDate: 'May 2023',
    cgpa: '7.5/10',
    coursework: [
      'Java Programming',
      'Python Programming',
      'Data Structures and Algorithms',
      'Database Management Systems',
      'Mathematics',
      'Engineering Mechanics',
    ],
    project:
        'Automatic Motor Bike Stand Slider - Designed and implemented automated stand mechanism using Arduino microcontroller, servo motors, and ultrasonic sensors',
  );

  // Certification
  static const Certification certification = Certification(
    name: 'Full Stack Java Development Certification',
    institution: 'ISM University, Bangalore',
    date: 'Sep 2023',
    highlights: [
      'Comprehensive training in Java, Spring Boot, Hibernate, React.js, Node.js, Express.js, MongoDB, MySQL, and RESTful API development',
      'Developed Portfolio Management System with 20+ features including JWT authentication',
      'Implemented 10+ JavaScript event handlers and 5+ backend programs using Spring Boot',
    ],
  );

  // Navigation Items
  static const List<Map<String, dynamic>> navItems = [
    {'label': 'Home', 'icon': Icons.home_outlined},
    {'label': 'About', 'icon': Icons.person_outline},
    {'label': 'Skills', 'icon': Icons.code_outlined},
    {'label': 'Experience', 'icon': Icons.work_outline},
    {'label': 'Projects', 'icon': Icons.folder_outlined},
    {'label': 'Contact', 'icon': Icons.mail_outline},
  ];
}
