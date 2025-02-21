abstract class TokenProvider {
  String? getAccessToken();
  String? getRefreshToken();
  Future<bool> setAccessToken(String token);
  Future<bool> setRefreshToken(String token);
}
