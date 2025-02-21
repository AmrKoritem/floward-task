import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_state.freezed.dart';

@freezed
class BaseState<T> with _$BaseState<T> {
  factory BaseState({
    @Default(false) bool isLoading,
    required T data,
  }) = _BaseState;
}
