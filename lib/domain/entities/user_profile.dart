class UserProfile {
  final String id;
  final String fullName;
  final String email;
  final String collegeName;
  final String department;
  final int semester;
  final int yearOfStudy;
  final String targetCareerGoal;
  final int dailyStudyHours;

  const UserProfile({
    required this.id,
    required this.fullName,
    required this.email,
    this.collegeName = '',
    this.department = '',
    this.semester = 1,
    this.yearOfStudy = 1,
    this.targetCareerGoal = '',
    this.dailyStudyHours = 2,
  });

  UserProfile copyWith({
    String? id,
    String? fullName,
    String? email,
    String? collegeName,
    String? department,
    int? semester,
    int? yearOfStudy,
    String? targetCareerGoal,
    int? dailyStudyHours,
  }) {
    return UserProfile(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      collegeName: collegeName ?? this.collegeName,
      department: department ?? this.department,
      semester: semester ?? this.semester,
      yearOfStudy: yearOfStudy ?? this.yearOfStudy,
      targetCareerGoal: targetCareerGoal ?? this.targetCareerGoal,
      dailyStudyHours: dailyStudyHours ?? this.dailyStudyHours,
    );
  }
}
