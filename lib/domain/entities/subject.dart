enum DifficultyLevel { easy, medium, hard, veryHard }

class Subject {
  final String id;
  final String name;
  final DifficultyLevel difficulty;
  final double completionPercentage;

  const Subject({
    required this.id,
    required this.name,
    required this.difficulty,
    this.completionPercentage = 0.0,
  });

  Subject copyWith({
    String? id,
    String? name,
    DifficultyLevel? difficulty,
    double? completionPercentage,
  }) {
    return Subject(
      id: id ?? this.id,
      name: name ?? this.name,
      difficulty: difficulty ?? this.difficulty,
      completionPercentage: completionPercentage ?? this.completionPercentage,
    );
  }
}
