class ApiResponse<T> {
  const ApiResponse({this.data, this.message, this.statusCode});

  final T? data;
  final String? message;
  final int? statusCode;

  bool get isSuccess =>
      statusCode != null && statusCode! >= 200 && statusCode! < 300;
}


     