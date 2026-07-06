class Exam {
  final String id;
  final String subjectId;
  final String subjectName;
  final DateTime examDate;
  final String examType;
  final int totalMarks;
  final double preparationPercentage;

  const Exam({
    required this.id,
    required this.subjectId,
    required this.subjectName,
    required this.examDate,
    required this.examType,
    required this.totalMarks,
    this.preparationPercentage = 0.0,
  });

  Exam copyWith({
    String? id,
    String? subjectId,
    String? subjectName,
    DateTime? examDate,
    String? examType,
    int? totalMarks,
    double? preparationPercentage,
  }) {
    return Exam(
      id: id ?? this.id,
      subjectId: subjectId ?? this.subjectId,
      subjectName: subjectName ?? this.subjectName,
      examDate: examDate ?? this.examDate,
      examType: examType ?? this.examType,
      totalMarks: totalMarks ?? this.totalMarks,
      preparationPercentage: preparationPercentage ?? this.preparationPercentage,
    );
  }
}
