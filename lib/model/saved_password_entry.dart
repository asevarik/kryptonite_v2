class SavedPasswordEntry {
  int index;
  String websiteNickname;
  String entryUsername;
  String entryPassword;
  String passwordStatus;
  bool isPasswordStrong;
  bool isCurrentlyBeingEdited;

  SavedPasswordEntry({
    required this.index,
    required this.websiteNickname,
    required this.entryUsername,
    required this.entryPassword,
    required this.passwordStatus,
    required this.isPasswordStrong,
    this.isCurrentlyBeingEdited = false,
  });
}
