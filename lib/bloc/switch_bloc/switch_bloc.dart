


import 'package:example_bloc/bloc/switch_bloc/switch_event.dart';
import 'package:example_bloc/bloc/switch_bloc/switch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchStates>{

  SwitchBloc():super(SwitchStates()){
    on<EnableorDisableNotification>(_enableOrDisableNotification);
    on<SliderEvent>(_slider);
  }

  void _enableOrDisableNotification(EnableorDisableNotification events,Emitter<SwitchStates> emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _slider (SliderEvent events, Emitter<SwitchStates> emit){
    emit(state.copyWith(slider:events.slider));
  }



}