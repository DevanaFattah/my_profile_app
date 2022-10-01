class User {
  final String imagePath;
  final String name;
  final String email;
  final String about;
  final bool isDarkMode;
  final String instagramUrl;
  final String githubUrl;
  final String facebookUrl;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
    required this.isDarkMode,
    required this.instagramUrl,
    required this.githubUrl,
    required this.facebookUrl
  });
}