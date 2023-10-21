extension StringExtension on String {
    String camelString() {
      return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
    }
}