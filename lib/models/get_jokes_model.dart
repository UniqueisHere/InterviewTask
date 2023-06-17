import 'dart:convert';

class JokesAPI {
  final String createdAt;
  final String iconUrl;
  final String id;
  final String updatedAt;
  final String url;
  final String joke;

  const JokesAPI({
    required this.createdAt,
    required this.iconUrl,
    required this.id,
    required this.updatedAt,
    required this.url,
    required this.joke,
  });

  factory JokesAPI.fromMap(Map<String, dynamic> map) {
    return JokesAPI(
      createdAt: map['created_at'],
      iconUrl: map['icon_url'],
      id: map['id'],
      updatedAt: map['updated_at'],
      url: map['url'],
      joke: map['value'],
    );
  }

  factory JokesAPI.fromJson(String data) {
    return JokesAPI.fromMap(json.decode(data));
  }
}
