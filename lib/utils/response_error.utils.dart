class ResponseError {
  List<String> messages;
  int statusCode;
  String error;

  ResponseError({
    required this.messages,
    required this.statusCode,
    required this.error,
  });

  Map<String, dynamic> toMap() => {
        "messages": messages,
        "statusCode": statusCode,
        "error": error,
      };

  factory ResponseError.fromMap(Map<String, dynamic> json) => ResponseError(
        messages: List<String>.from(json["messages"].map((msg) => msg)),
        statusCode: json["statusCode"],
        error: json['error'],
      );
}
