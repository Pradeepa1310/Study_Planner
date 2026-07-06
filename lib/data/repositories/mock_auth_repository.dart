import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/auth_repository.dart';

class MockAuthRepository implements AuthRepository {
  UserProfile? _currentUser;

  @override
  Future<UserProfile?> getCurrentUser() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _currentUser;
  }

  @override
  Future<UserProfile> loginWithEmail(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    if (password.length < 6) {
      throw Exception('Invalid credentials');
    }
    _currentUser = UserProfile(
      id: 'mock_user_123',
      fullName: 'Test Student',
      email: email,
    );
    return _currentUser!;
  }

  @override
  Future<UserProfile> registerWithEmail(String fullName, String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    _currentUser = UserProfile(
      id: 'mock_user_123',
      fullName: fullName,
      email: email,
    );
    return _currentUser!;
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _currentUser = null;
  }
}
