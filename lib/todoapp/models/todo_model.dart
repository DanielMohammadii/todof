class TodoModel {
  String id;
  String title;
  String description;
  DateTime createdTime;
  TodoModel({
    this.id = '',
    required this.title,
    this.description = "",
    required this.createdTime,
  });
}
