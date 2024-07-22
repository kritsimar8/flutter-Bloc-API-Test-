

import 'package:example_bloc/bloc/post/posts_bloc.dart';
import 'package:example_bloc/bloc/post/posts_events.dart';
import 'package:example_bloc/bloc/post/posts_states.dart';
import 'package:example_bloc/bloc/switch_bloc/switch_bloc.dart';
import 'package:example_bloc/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatefulWidget{
  const PostsScreen({Key?key}): super(key:key);

  @override 
  State<PostsScreen> createState() => _PostsScreenState();
}
class _PostsScreenState extends State<PostsScreen>{

  @override 
  void initState(){
    super.initState();

    context.read<PostBloc>().add(PostFetched());
  }


  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: Text('Posts Apis'),
      ),
      body:BlocBuilder<PostBloc,PostStates>(
        builder: (context,state){
          switch(state.postStatus){
            case PostStatus.loading:
            return CircularProgressIndicator();
            case PostStatus.failure:
            return Text(state.message.toString());
            case PostStatus.success:
            return 
            Column(
              children:[
                TextFormField(
                  decoration:const InputDecoration(
                    hintText:'Serach with email',
                    border:OutlineInputBorder(),
                  ),
                  onChanged: (filterKey){
                    context.read<PostBloc>().add(SearchItem(filterKey));
                  },
                ),
                Expanded(child:  state.searchMessage.isNotEmpty?
                  Center(child:Text(state.searchMessage.toString())):
                ListView.builder(
              itemCount: state.temPostList.isEmpty? state.postList.length :state.temPostList.length,
              itemBuilder:(context,index){
                if(state.temPostList.isNotEmpty){
                   final item = state.temPostList[index];
                   return Card(
                      child: ListTile(
                        title: Text(item.email.toString()),
                        subtitle:Text(item.body.toString()),
                      ),
                   );
                }else{
                  final item = state.postList[index];
                  return Card(
                    child:ListTile(
                      title: Text(item.email.toString()),
                      subtitle: Text(item.body.toString()),
                    )
                  );
                }
              }
            ),)
              ]
            );
          }
        }
      )

    );
  }
}