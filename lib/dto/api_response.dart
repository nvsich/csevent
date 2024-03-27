class ApiResponse<T> {
  T? data;
  bool error;
  String? message;

  ApiResponse({this.data, this.message, this.error=false});
}