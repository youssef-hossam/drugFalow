part of 'contact_us_cubit.dart';

@immutable
sealed class ContactUsState {}

final class ContactUsInitial extends ContactUsState {}


class ContactUsLoading extends ContactUsState {}


class ContactUsError extends ContactUsState {}



class ContactUsSuccess extends ContactUsState {}


