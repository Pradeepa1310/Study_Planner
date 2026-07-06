enum TopicStatus { notStarted, inProgress, completed }

class Topic {
  final String id;
  final String subjectId;
  final String chapterName;
  final String name;
  final TopicStatus status;
  final String? personalNotes;
  final int priority;

  const Topic({
    required this.id,
    required this.subjectId,
    required this.chapterName,
    required this.name,
    this.status = TopicStatus.notStarted,
    this.personalNotes,
    this.priority = 0,
  });

  Topic copyWith({
    String? id,
    String? subjectId,
    String? chapterName,
    String? name,
    TopicStatus? status,
    String? personalNotes,
    int? priority,
  }) {
    return Topic(
      id: id ?? this.id,
      subjectId: subjectId ?? this.subjectId,
      chapterName: chapterName ?? this.chapterName,
      name: name ?? this.name,
      status: status ?? this.status,
      personalNotes: personalNotes ?? this.personalNotes,
      priority: priority ?? this.priority,
    );
  }
}
