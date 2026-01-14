part of 'subscribers_bloc.dart';

@freezed
class SubscribersState with _$SubscribersState {
  const factory SubscribersState.initial() = _Initial;
  const factory SubscribersState.loading() = _Loading;
  const factory SubscribersState.success({
    required List<SubscriberModel> subscribers,
  }) = _Success;
  const factory SubscribersState.error(String message) = _Error;
}
