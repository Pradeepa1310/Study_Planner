import '../entities/user_profile.dart';

abstract class AuthRepository {
  Future<UserProfile?> getCurrentUser();
  Future<UserProfile> loginWithEmail(String email, String password);
  Future<UserProfile> registerWithEmail(String fullName, String email, String password);
  Future<void> logout();
}
