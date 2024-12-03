class UserResponse {
  final String token;
  final List<PermissionWrapper> permission;

  UserResponse({
    required this.token,
    required this.permission,
  });

  // From JSON
  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      token: json['token'],
      permission: (json['permission'] as List)
          .map((item) => PermissionWrapper.fromJson(item))
          .toList(),
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'permission': permission.map((e) => e.toJson()).toList(),
    };
  }
}

// PermissionWrapper class (Wrapper for permissions and appID)
class PermissionWrapper {
  final String appID;
  final List<Permission> permission;

  PermissionWrapper({
    required this.appID,
    required this.permission,
  });

  // From JSON
  factory PermissionWrapper.fromJson(Map<String, dynamic> json) {
    return PermissionWrapper(
      appID: json['appID'],
      permission: (json['permission'] as List)
          .map((item) => Permission.fromJson(item))
          .toList(),
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'appID': appID,
      'permission': permission.map((e) => e.toJson()).toList(),
    };
  }
}

// Permission class (Representing individual permissions)
class Permission {
  final String name;
  final bool allAccess;

  Permission({
    required this.name,
    required this.allAccess,
  });

  // From JSON
  factory Permission.fromJson(Map<String, dynamic> json) {
    return Permission(
      name: json['name'],
      allAccess: json['allAccess'],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'allAccess': allAccess,
    };
  }
}
