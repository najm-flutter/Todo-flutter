import 'package:todo/features/todo/domain/entities/todo_enti.dart';

class TodoModel extends TodoEnti {
  const TodoModel(
      { super.id,
      required super.iconId,
      required super.isDone,
      required super.title,
      required super.description,
      required super.time});

  factory TodoModel.fromJson(Map<String, dynamic> data) {
    return TodoModel(
        id: data["id"],
        iconId: data["iconId"],
        isDone: data["isDone"],
        title: data["title"],
        description: data["description"],
        time: data["time"]);
  }
  Map<String, Object?> toJson() {
    final Map<String, Object?> data = <String, Object?>{};
    data["iconId"] = iconId;
    data["isDone"] = isDone;
    data["title"] = title;
    data["description"] = description;
    data["time"] = time;
    return data;
  }
}
