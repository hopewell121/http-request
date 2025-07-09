

class PostUserModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostUserModel({
    this.userId,
    this.id,
    this.title,
    this.body
  });

  PostUserModel.fromJson(Map<String, dynamic> json){
  userId =json ['userId'];
  id =json ['id'];
  title =json ['title'];
  body =json ['body'];
    }
  }

