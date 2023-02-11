// // To parse this JSON data, do
// //
// //     final post = postFromJson(jsonString);

// import 'dart:convert';

// Post postFromJson(String str) => Post.fromJson(json.decode(str));

// String postToJson(Post data) => json.encode(data.toJson());

// class Post {
//     Post({
//         required this.creators,
//     });

//     List<Creator> creators;

//     factory Post.fromJson(Map<String, dynamic> json) => Post(
//         creators: List<Creator>.from(json["creators"].map((x) => Creator.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "creators": List<dynamic>.from(creators.map((x) => x.toJson())),
//     };
// }

// class Creator {
//     Creator({
//         required this.id,
//         required this.userName,
//         required this.profileUrl,
//         required this.profession,
//     });

//     String id;
//     String userName;
//     String profileUrl;
//     String profession;

//     factory Creator.fromJson(Map<String, dynamic> json) => Creator(
//         id: json["id"],
//         userName: json["userName"],
//         profileUrl: json["profileUrl"],
//         profession: json["profession"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "userName": userName,
//         "profileUrl": profileUrl,
//         "profession": profession,
//     };
// }
