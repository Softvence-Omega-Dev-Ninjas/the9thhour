class ProfileModel {
  final String id;
  final String name;
  final String title;
  final String profileImage;
  final String skinTone;
  final String skinType;
  final String hairType;
  final String goal;
  final String budget;

  ProfileModel({
    required this.id,
    required this.name,
    required this.title,
    required this.profileImage,
    required this.skinTone,
    required this.skinType,
    required this.hairType,
    required this.goal,
    required this.budget,
  });

  // Copy with method for updating profile
  ProfileModel copyWith({
    String? id,
    String? name,
    String? title,
    String? profileImage,
    String? skinTone,
    String? skinType,
    String? hairType,
    String? goal,
    String? budget,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      name: name ?? this.name,
      title: title ?? this.title,
      profileImage: profileImage ?? this.profileImage,
      skinTone: skinTone ?? this.skinTone,
      skinType: skinType ?? this.skinType,
      hairType: hairType ?? this.hairType,
      goal: goal ?? this.goal,
      budget: budget ?? this.budget,
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'title': title,
      'profileImage': profileImage,
      'skinTone': skinTone,
      'skinType': skinType,
      'hairType': hairType,
      'goal': goal,
      'budget': budget,
    };
  }

  // Create from JSON
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] as String,
      name: json['name'] as String,
      title: json['title'] as String,
      profileImage: json['profileImage'] as String,
      skinTone: json['skinTone'] as String,
      skinType: json['skinType'] as String,
      hairType: json['hairType'] as String,
      goal: json['goal'] as String,
      budget: json['budget'] as String,
    );
  }
}
