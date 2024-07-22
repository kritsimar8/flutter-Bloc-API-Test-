

import 'package:equatable/equatable.dart';
import 'package:example_bloc/model/post_model.dart';
import 'package:example_bloc/utils/enums.dart';

class PostStates extends Equatable{
  final PostStatus postStatus;
  final List<PostModel> postList;
  final List<PostModel> temPostList;
  final String message;
  final String searchMessage;

  const PostStates({
    this.postStatus=PostStatus.loading,
    this.postList = const <PostModel>[],
    this.temPostList = const <PostModel>[],
    this.message='',
    this.searchMessage='',
    
  });

  PostStates copyWith({PostStatus? postStatus,List<PostModel>? postList,List<PostModel>? temPostList, String?message,String? searchMessage}){
    return PostStates(
      postStatus:postStatus?? this.postStatus,
      postList:postList?? this.postList,
      temPostList: temPostList ?? this.temPostList,
      message: message?? this.message,
      searchMessage:searchMessage?? this.searchMessage,
    );
  }



  @override 

  List<Object?> get props=>[postStatus ,postStatus,temPostList,message,searchMessage];




}