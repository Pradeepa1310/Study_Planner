import '../../domain/entities/subject.dart';
import '../../domain/repositories/subject_repository.dart';

class MockSubjectRepository implements SubjectRepository {
  final List<Subject> _subjects = [
    const Subject(
      id: '1',
      name: 'Java Programming',
      difficulty: DifficultyLevel.hard,
      completionPercentage: 45.0,
    ),
    const Subject(
      id: '2',
      name: 'Database Management Systems',
      difficulty: DifficultyLevel.medium,
      completionPercentage: 20.0,
    ),
    const Subject(
      id: '3',
      name: 'English Communication',
      difficulty: DifficultyLevel.easy,
      completionPercentage: 90.0,
    ),
  ];

  @override
  Future<List<Subject>> getSubjects() async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate network delay
    return [..._subjects];
  }

  @override
  Future<void> addSubject(Subject subject) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _subjects.add(subject);
  }

  @override
  Future<void> updateSubject(Subject subject) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _subjects.indexWhere((s) => s.id == subject.id);
    if (index != -1) {
      _subjects[index] = subject;
    }
  }

  @override
  Future<void> deleteSubject(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _subjects.removeWhere((s) => s.id == id);
  }
}
