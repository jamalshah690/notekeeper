class Task {
  final String id;
  final String name;

  Task({required this.id, required this.name});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['taskId']?? '',
      name: json['taskTitle']?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'taskId': id,
      'taskTitle': name,
    };
  }
}
