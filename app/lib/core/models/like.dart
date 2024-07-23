
class LikeModel{
  final int id;
  final int user_id;
  final int post_id;

  LikeModel({required this.id, required this.user_id, required this.post_id});

  factory LikeModel.fromJson(Map<String, dynamic> json) {
    return LikeModel(
      id: json['id'],
      user_id: json['user_id'],
      post_id: json['post_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': user_id,
      'post_id': post_id,
    };
  }

}