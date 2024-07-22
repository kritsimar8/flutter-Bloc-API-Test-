


import 'package:bloc/bloc.dart';
import 'package:example_bloc/bloc/post/posts_events.dart';
import 'package:example_bloc/bloc/post/posts_states.dart';
import 'package:example_bloc/model/post_model.dart';
import 'package:example_bloc/repository/post_repository.dart';
import 'package:example_bloc/utils/enums.dart';

class PostBloc extends Bloc<PostsEvent,PostStates>{


  List<PostModel> temPostList=[];

  PostRepository postRepository = PostRepository();
  PostBloc():super(const PostStates()){
     on<PostFetched>(fetchPostApi);
     on<SearchItem>(_filterList);
  }

  void _filterList(SearchItem event, Emitter<PostStates> emit)async{
    if(event.stSearch.isEmpty){
        emit(state.copyWith(temPostList:[],searchMessage:''));
    }else{
      temPostList = state.postList.where((element)=> element.email.toString().toLowerCase().contains(event.stSearch.toLowerCase()) ).toList();
      if(temPostList.isEmpty){
        emit(state.copyWith(temPostList: temPostList,searchMessage:'No data found'));
      }else{
        emit(state.copyWith(temPostList:temPostList));
      }
    }
    
    print(temPostList.length);
  }




  void fetchPostApi(PostFetched event, Emitter<PostStates> emit) async{
   await postRepository.fetchPost().then((value){
      emit(state.copyWith(
        postStatus: PostStatus.success,
        message: 'success',
        postList: value
      ));
    }).onError((error,StackTrace){
      emit(state.copyWith(postStatus: PostStatus.failure,message:error.toString()));
    });
  }




}