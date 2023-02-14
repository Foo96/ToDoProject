// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `This field`
  String get ThisField {
    return Intl.message(
      'This field',
      name: 'ThisField',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get Skip {
    return Intl.message(
      'Skip',
      name: 'Skip',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get Continue {
    return Intl.message(
      'Continue',
      name: 'Continue',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get Next {
    return Intl.message(
      'Next',
      name: 'Next',
      desc: '',
      args: [],
    );
  }

  /// `Get's Start`
  String get GetStart {
    return Intl.message(
      'Get\'s Start',
      name: 'GetStart',
      desc: '',
      args: [],
    );
  }

  /// `Daily Plan for `
  String get DailyPlanFor {
    return Intl.message(
      'Daily Plan for ',
      name: 'DailyPlanFor',
      desc: '',
      args: [],
    );
  }

  /// `My Plan`
  String get MyPlan {
    return Intl.message(
      'My Plan',
      name: 'MyPlan',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get Total {
    return Intl.message(
      'Total',
      name: 'Total',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get Completed {
    return Intl.message(
      'Completed',
      name: 'Completed',
      desc: '',
      args: [],
    );
  }

  /// `In Progress`
  String get InProgress {
    return Intl.message(
      'In Progress',
      name: 'InProgress',
      desc: '',
      args: [],
    );
  }

  /// `Overview`
  String get Overview {
    return Intl.message(
      'Overview',
      name: 'Overview',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get SeeAll {
    return Intl.message(
      'See All',
      name: 'SeeAll',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation`
  String get Confirmation {
    return Intl.message(
      'Confirmation',
      name: 'Confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get Warning {
    return Intl.message(
      'Warning',
      name: 'Warning',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get Success {
    return Intl.message(
      'Success',
      name: 'Success',
      desc: '',
      args: [],
    );
  }

  /// `You've got {total} tasks today.`
  String TodayTaskQty(Object total) {
    return Intl.message(
      'You\'ve got $total tasks today.',
      name: 'TodayTaskQty',
      desc: 'today task quantity',
      args: [total],
    );
  }

  /// `Ok`
  String get Ok {
    return Intl.message(
      'Ok',
      name: 'Ok',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get Confirm {
    return Intl.message(
      'Confirm',
      name: 'Confirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message(
      'Cancel',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  /// `Create Plan`
  String get CreatePlan {
    return Intl.message(
      'Create Plan',
      name: 'CreatePlan',
      desc: '',
      args: [],
    );
  }

  /// `Modify Plan`
  String get ModifyPlan {
    return Intl.message(
      'Modify Plan',
      name: 'ModifyPlan',
      desc: '',
      args: [],
    );
  }

  /// `Delete Plan`
  String get DeletePlan {
    return Intl.message(
      'Delete Plan',
      name: 'DeletePlan',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get Date {
    return Intl.message(
      'Date',
      name: 'Date',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get Category {
    return Intl.message(
      'Category',
      name: 'Category',
      desc: '',
      args: [],
    );
  }

  /// `Priority`
  String get Priority {
    return Intl.message(
      'Priority',
      name: 'Priority',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get Status {
    return Intl.message(
      'Status',
      name: 'Status',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get Description {
    return Intl.message(
      'Description',
      name: 'Description',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get Title {
    return Intl.message(
      'Title',
      name: 'Title',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get Apply {
    return Intl.message(
      'Apply',
      name: 'Apply',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get About {
    return Intl.message(
      'About',
      name: 'About',
      desc: '',
      args: [],
    );
  }

  /// `{code, select, en{ENG} zh{CHI} ms{MAY} other{LAIN-LAIN}}`
  String languageCode(Object code) {
    return Intl.select(
      code,
      {
        'en': 'ENG',
        'zh': 'CHI',
        'ms': 'MAY',
        'other': 'LAIN-LAIN',
      },
      name: 'languageCode',
      desc: 'language code',
      args: [code],
    );
  }

  /// `{code, select, en{ENGLISH} zh{华语} ms{BAHASA MELAYU} other{OTHERS}}`
  String languageName(Object code) {
    return Intl.select(
      code,
      {
        'en': 'ENGLISH',
        'zh': '华语',
        'ms': 'BAHASA MELAYU',
        'other': 'OTHERS',
      },
      name: 'languageName',
      desc: 'language full name',
      args: [code],
    );
  }

  /// `Language Settings`
  String get LanguageSettings {
    return Intl.message(
      'Language Settings',
      name: 'LanguageSettings',
      desc: '',
      args: [],
    );
  }

  /// `{done} / {total} Completed`
  String CompletedQty(Object done, Object total) {
    return Intl.message(
      '$done / $total Completed',
      name: 'CompletedQty',
      desc: 'completed quantity',
      args: [done, total],
    );
  }

  /// `Please wait while, getting everything ready...`
  String get MsgLaunchingApp {
    return Intl.message(
      'Please wait while, getting everything ready...',
      name: 'MsgLaunchingApp',
      desc: '',
      args: [],
    );
  }

  /// `Plaese wait while, we are processing your request...`
  String get MsgProcessRequest {
    return Intl.message(
      'Plaese wait while, we are processing your request...',
      name: 'MsgProcessRequest',
      desc: '',
      args: [],
    );
  }

  /// `Hello, Welcom back!`
  String get MsgWelcome {
    return Intl.message(
      'Hello, Welcom back!',
      name: 'MsgWelcome',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure want to delete this item?`
  String get MsgConfirmDeleteToDoItem {
    return Intl.message(
      'Are you sure want to delete this item?',
      name: 'MsgConfirmDeleteToDoItem',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure want to change your priority from {previous} to {news}?`
  String MsgChangePriority(Object previous, Object news) {
    return Intl.message(
      'Are you sure want to change your priority from $previous to $news?',
      name: 'MsgChangePriority',
      desc: 'change priority',
      args: [previous, news],
    );
  }

  /// `Item Not Found`
  String get MsgItemNoFound {
    return Intl.message(
      'Item Not Found',
      name: 'MsgItemNoFound',
      desc: '',
      args: [],
    );
  }

  /// `Item successfully created`
  String get MsgItemCreateSuccess {
    return Intl.message(
      'Item successfully created',
      name: 'MsgItemCreateSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Item successfully modified`
  String get MsgItemModifySuccess {
    return Intl.message(
      'Item successfully modified',
      name: 'MsgItemModifySuccess',
      desc: '',
      args: [],
    );
  }

  /// `Item successfully deleted`
  String get MsgItemDeleteSuccess {
    return Intl.message(
      'Item successfully deleted',
      name: 'MsgItemDeleteSuccess',
      desc: '',
      args: [],
    );
  }

  /// ` is a required item.`
  String get MsgValidFieldRequired {
    return Intl.message(
      ' is a required item.',
      name: 'MsgValidFieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid mobile number`
  String get MsgValidErrorPhoneInvalid {
    return Intl.message(
      'Please enter valid mobile number',
      name: 'MsgValidErrorPhoneInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid email address`
  String get MsgValidErrorEmailInvalid {
    return Intl.message(
      'Please enter valid email address',
      name: 'MsgValidErrorEmailInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid verification code`
  String get MsgValidErrorVerifyCodeInvalid {
    return Intl.message(
      'Please enter valid verification code',
      name: 'MsgValidErrorVerifyCodeInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your OTP number`
  String get MsgValidErrorOTPEmpty {
    return Intl.message(
      'Please enter your OTP number',
      name: 'MsgValidErrorOTPEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid OTP number`
  String get MsgValidErrorOTPInvalid {
    return Intl.message(
      'Please enter valid OTP number',
      name: 'MsgValidErrorOTPInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Both PINs must be the same`
  String get MsgValidErrorPInNotSame {
    return Intl.message(
      'Both PINs must be the same',
      name: 'MsgValidErrorPInNotSame',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid name with letter and spaces only`
  String get MsgValidErrorNameInvalid {
    return Intl.message(
      'Please enter valid name with letter and spaces only',
      name: 'MsgValidErrorNameInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Your profile is incomplete. Kindly update!`
  String get MsgValidProfileIncomplete {
    return Intl.message(
      'Your profile is incomplete. Kindly update!',
      name: 'MsgValidProfileIncomplete',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
