import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

class SidePanelState {
  final Widget? content;
  final bool isOpen;

  SidePanelState({this.content, this.isOpen = false});
}

@lazySingleton
class SidePanelCubit extends Cubit<SidePanelState> {
  SidePanelCubit() : super(SidePanelState());

  void open(Widget content) {
    emit(SidePanelState(content: content, isOpen: true));
  }

  void hide() {
    emit(SidePanelState(content: null, isOpen: false));
  }
}
