abstract class AppValidator {
  static String? field(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Field is required";
    }
    return null;
  }
}
