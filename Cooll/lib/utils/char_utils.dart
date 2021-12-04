class CharUtils {
  static String generateFlagEmojiCode({required String countryCode}) {
    const base = 127397;

    String flagCode = countryCode.codeUnits
        .map((unit) => String.fromCharCode(base + unit))
        .toList()
        .reduce((value, element) => value + element)
        .toString();
    return flagCode;
  }
}
