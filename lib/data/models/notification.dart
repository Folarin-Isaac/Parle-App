class NotificationModel {
  final String id;
  final String category;
  final String title;
  final String? date;
  final String? time;
  final bool isRead;

  const NotificationModel({
    required this.id,
    required this.category,
    required this.title,
    this.date,
    this.time,
    this.isRead = false,
  });
}