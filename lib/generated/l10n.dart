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

  /// `Find and Meet people around\nyou to find LOVE`
  String get shortIntroduction {
    return Intl.message(
      'Find and Meet people around\nyou to find LOVE',
      name: 'shortIntroduction',
      desc: '',
      args: [],
    );
  }

  /// `SIGN IN`
  String get SIGNIN {
    return Intl.message(
      'SIGN IN',
      name: 'SIGNIN',
      desc: '',
      args: [],
    );
  }

  /// `GET STARTED`
  String get GETSTARTED {
    return Intl.message(
      'GET STARTED',
      name: 'GETSTARTED',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Remember Password`
  String get rememberPassword {
    return Intl.message(
      'Remember Password',
      name: 'rememberPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get hintEmail {
    return Intl.message(
      'Please enter a valid email',
      name: 'hintEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get hintPassword {
    return Intl.message(
      'Please enter your password',
      name: 'hintPassword',
      desc: '',
      args: [],
    );
  }

  /// `FORGOT PASSWORD?`
  String get forgotPassword {
    return Intl.message(
      'FORGOT PASSWORD?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `DON'T HAVE ACCOUNT?`
  String get dontHaveAccount {
    return Intl.message(
      'DON\'T HAVE ACCOUNT?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `SIGN UP`
  String get SIGNUP {
    return Intl.message(
      'SIGN UP',
      name: 'SIGNUP',
      desc: '',
      args: [],
    );
  }

  /// `Enter Email`
  String get enterEmail {
    return Intl.message(
      'Enter Email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get enterPassword {
    return Intl.message(
      'Password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Popular`
  String get Popular {
    return Intl.message(
      'Popular',
      name: 'Popular',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `No data to display`
  String get noData {
    return Intl.message(
      'No data to display',
      name: 'noData',
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
      Locale.fromSubtags(languageCode: 'ja'),
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
