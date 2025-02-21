import 'request_type.dart';

class NetworkRequest {
  String url;
  RequestType type;
  Map<String, String>? headers;
  Map<String, dynamic>? parameters;

  NetworkRequest({
    required this.url,
    required this.type,
    this.headers,
    this.parameters,
  });
}
