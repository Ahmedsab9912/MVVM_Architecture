import 'package:providerprac/data/response/status.dart';

// class of api response
class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

// constructor
  ApiResponse(this.status, this.data, this.message);
  // named constructor
  ApiResponse.loading() : status = Status.LOADING;
  // named constructor
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  // named constructor
  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}
