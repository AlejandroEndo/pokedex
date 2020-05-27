class Generic {
  String url;
  String name;
  Generic({this.name, this.url});

  Map toJson() => {
        'url': url,
        'name': name,
      };

  factory Generic.fromJson(Map<String, dynamic> json) {
    return Generic(
      url: json['url'],
      name: json['name'],
    );
  }
}
