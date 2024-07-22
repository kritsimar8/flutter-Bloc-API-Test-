import 'package:equatable/equatable.dart';
import 'package:example_bloc/bloc/counter_bloc/counter_bloc.dart';
import 'package:example_bloc/bloc/fav_bloc/favourite_app_bloc.dart';
import 'package:example_bloc/bloc/post/posts_bloc.dart';
import 'package:example_bloc/bloc/switch_bloc/switch_bloc.dart';
import 'package:example_bloc/repository/favourite_repository.dart';
import 'package:example_bloc/ui/counter.dart';
import 'package:example_bloc/ui/favourite_app.dart';
import 'package:example_bloc/ui/posts_screen.dart';
import 'package:example_bloc/ui/switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return MultiBlocProvider(
    providers:[
      BlocProvider(create:(_)=> CounterBloc()),
      BlocProvider(create:(_)=> SwitchBloc()),
      BlocProvider(create: (_)=> FavouriteBloc(FavouriteRepository()),),
      BlocProvider(create: (_)=> PostBloc()),
    ],
   
    child:  MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const PostsScreen(),
    )
   );
   
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        
        
      
      ),
      body: Center(

        child: Column(
       
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'hello',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Person person = Person(name:'hello', age:20);
          Person person1= Person(name:'hello', age:20);

          print(person.hashCode.toString());
          print(person1.hashCode.toString());
          // print(person1);
          print('hello');

          
        },
       
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Person extends Equatable{
  final String name;
  final int age;

  const Person({required this.name, required this.age});
  
  @override
 
  List<Object?> get props => [name,age];
}