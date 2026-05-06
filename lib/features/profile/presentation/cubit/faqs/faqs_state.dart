part of 'faqs_cubit.dart';

@immutable
sealed class FaqsState {}

final class FaqsInitial extends FaqsState {}


class FaqsLoading extends FaqsState {}



class FaqsError extends FaqsState {}




class FaqsSuccess extends FaqsState {}
