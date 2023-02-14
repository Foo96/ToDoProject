class TutorialDetails{
  String imageUrl;
  String title;
  String description;

  TutorialDetails({
    required this.imageUrl,
    required this.title,
    required this.description
  });

  factory TutorialDetails.fromJson(Map<String, dynamic> json) => TutorialDetails(
    imageUrl: json["imageUrl"] ?? "",
    title: json["title"] ?? "",
    description: json["description"]??""
  );
}