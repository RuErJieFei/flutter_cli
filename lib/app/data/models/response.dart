class CommonResponse<T> {
  late int code;
  late String msg;
  T? data;

  CommonResponse({required this.code, required this.msg, this.data});

  CommonResponse.fromJson(Map<String, dynamic> json) {
    this.code = json['code'];
    this.msg = json['msg'];
    this.data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    return data;
  }
}
