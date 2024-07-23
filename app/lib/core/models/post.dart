// class PostModel {

//   final int id;
//   final int user_id;
//   final String image_id;
//   final String content;
//   final DateTime created_at;

//   PostModel({required this.id, required this.user_id, this.image_id, required this.lastName});

//   factory PostModel.fromJson(Map<String, dynamic> json) {
//     return PostModel(
//       id: json['id'],
//       username: json['username'],
//       firstName: json['first_name'],
//       lastName: json['last_name'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'username': username,
//       'first_name': firstName,
//       'last_name': lastName
//     };
//   }
// }