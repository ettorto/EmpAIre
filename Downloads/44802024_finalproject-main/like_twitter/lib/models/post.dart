class Post {
  final String handle;
  final String username;
  final String postContent;
  final String profileImageUrl;
  final String postImageUrl;
  final String timeAgo;

  Post({
    required this.handle,
    required this.username,
    required this.postContent,
    required this.profileImageUrl,
    required this.postImageUrl,
    required this.timeAgo,
  });
  
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      handle: json['name'],
      username: json['username'],
      postContent: json['postContent'],
      profileImageUrl: json['profileImageUrl'],
      postImageUrl: json['postImageUrl'],
      timeAgo: json['timeAgo'],
    );
  }
}
