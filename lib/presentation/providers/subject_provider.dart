import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/subject.dart';
import '../../domain/repositories/subject_repository.dart';
import '../../data/repositories/mock_subject_repository.dart';

// Provider for the repository (can be swapped with Firebase repository later)
final subjectRepositoryProvider = Provider<SubjectRepository>((ref) {
  return MockSubjectRepository();
});

// StateNotifier to manage the list of subjects in the UI
class SubjectsNotifier extends StateNotifier<AsyncValue<List<Subject>>> {
  final SubjectRepository _repository;

  SubjectsNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadSubjects();
  }

  Future<void> loadSubjects() async {
    state = const AsyncValue.loading();
    try {
      final subjects = await _repository.getSubjects();
      state = AsyncValue.data(subjects);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> addSubject(Subject subject) async {
    try {
      await _repository.addSubject(subject);
      await loadSubjects();
    } catch (e) {
      // Handle error appropriately
    }
  }

  Future<void> deleteSubject(String id) async {
    try {
      await _repository.deleteSubject(id);
      await loadSubjects();
    } catch (e) {
      // Handle error appropriately
    }
  }
}

// Provider for the UI to listen to
final subjectsProvider = StateNotifierProvider<SubjectsNotifier, AsyncValue<List<Subject>>>((ref) {
  final repository = ref.watch(subjectRepositoryProvider);
  return SubjectsNotifier(repository);
});
