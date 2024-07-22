import 'package:example_bloc/bloc/switch_bloc/switch_bloc.dart';
import 'package:example_bloc/bloc/switch_bloc/switch_event.dart';
import 'package:example_bloc/bloc/switch_bloc/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchExample extends StatefulWidget{
  const SwitchExample({super.key});

  @override 
  State<SwitchExample> createState()=> _CounterScreenState();
}

class _CounterScreenState extends State<SwitchExample>{

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            const Text('Notifications'),
            BlocBuilder<SwitchBloc,SwitchStates>(
              builder: (context,state){
                return Switch(value:state.isSwitch,
            onChanged:(newValue){
              context.read<SwitchBloc>().add(EnableorDisableNotification());
            });
              })
            
          ],),
          const SizedBox(height:30),
          BlocBuilder<SwitchBloc,SwitchStates>(
            builder: (context,state){
              return   Container(
            height:200,
            color:Colors.red.withOpacity(state.slider),
          );
            }),
        
          const SizedBox(height:50),
          BlocBuilder<SwitchBloc,SwitchStates>(
            builder: (context,state){
              return Slider(value:state.slider,onChanged:(value){
                print(value);
                context.read<SwitchBloc>().add(SliderEvent(slider:value));
              });
            }),
        
        ],)
      )
    );
  }


}