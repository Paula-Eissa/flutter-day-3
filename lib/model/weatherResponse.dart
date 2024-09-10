class WeatherResponse {
  List<Result> results = [];

  WeatherResponse(this.results);

  WeatherResponse.fromJson(Map<String, dynamic> json) {
    json['weather'].forEach((e) => results.add(Result.fromJson(e)));
  }
}

class Result {
  String description;
  String icon;

  Result(this.description, this.icon);

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      json['description'],
      json['icon'],
    );
  }
}
