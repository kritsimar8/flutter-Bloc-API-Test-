

abstract class SwitchEvents{
  SwitchEvents();
  @override 
  List<Object> get props =>[];
}

class EnableorDisableNotification extends SwitchEvents{}

class SliderEvent extends SwitchEvents{
  double slider;
  SliderEvent({required this.slider});

  @override 
  List<Object> get props=>[slider];
}
