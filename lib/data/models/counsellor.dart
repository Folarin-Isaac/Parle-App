class Counsellor {
  final String id;
  final String name;
  final String imageUrl;
  final bool isOnline;
  final String? specialty;

  const Counsellor({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.isOnline = false,
    this.specialty,
  });
}