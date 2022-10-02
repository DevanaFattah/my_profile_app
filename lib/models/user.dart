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
    this.isDarkMode = false,
    required this.instagramUrl,
    required this.githubUrl,
    required this.facebookUrl
  });

  User clone({
    String? imagePath,
    String? name,
    String? email,
    String? about,
    String? instagramUrl,
    String? githubUrl,
    String? facebookUrl,
  }) => User (
    imagePath: imagePath ?? this.imagePath,
    name: name ?? this.name,
    email: email ?? this.email,
    about: about ?? this.about,
    instagramUrl: instagramUrl ?? this.instagramUrl,
    githubUrl: githubUrl ?? this.githubUrl,
    facebookUrl: facebookUrl ?? this.facebookUrl,
    isDarkMode: false,
  );

  Map<String, dynamic> toJson() => {
    'imagePath': imagePath,
    'name': name,
    'email': email,
    'about': about,
    'instagramUrl': instagramUrl,
    'githubUrl': githubUrl,
    'facebookUrl': facebookUrl,
  };

  static User fromJson(Map<String, dynamic> json) => User(
    imagePath: json['imagePath'],
    name: json['name'],
    email: json['email'],
    about: json['about'],
    instagramUrl: json['instagramUrl'],
    githubUrl: json['githubUrl'],
    facebookUrl: json['facebookUrl'],
  );
}