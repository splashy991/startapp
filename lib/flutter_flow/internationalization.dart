import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ru', 'kk'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ruText = '',
    String? kkText = '',
  }) =>
      [ruText, kkText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'jl70ta64': {
      'ru': 'startapp',
      'kk': 'startapp',
    },
    'o07jdbsg': {
      'ru': 'Поиск проектов',
      'kk': 'Жобаны іздеу',
    },
    'h3aoc6z2': {
      'ru': 'Главная',
      'kk': 'Басты бет',
    },
  },
  // sign_in
  {
    'bx39d8gu': {
      'ru': 'startapp',
      'kk': 'startapp',
    },
    'k2xbsy2v': {
      'ru': 'Войти',
      'kk': 'Кіру',
    },
    'vtu0cpnr': {
      'ru': '',
      'kk': '',
    },
    '9b7o4937': {
      'ru': 'Адрес электронной почты',
      'kk': 'Құпия сөз',
    },
    '7ogy6ni1': {
      'ru': '',
      'kk': '',
    },
    'jtlz2c0e': {
      'ru': 'Пароль',
      'kk': 'Құпия сөз',
    },
    '4lu8g9yc': {
      'ru': 'Вход',
      'kk': 'Кіру',
    },
    'cneni9m5': {
      'ru': 'Не зарегистрированы?',
      'kk': 'Тіркелмедіңіз бе?',
    },
    'uiplj95l': {
      'ru': '   Регистрация',
      'kk': 'Тіркелу',
    },
    '12ek7ea0': {
      'ru': 'Қазақша',
      'kk': 'Казахский',
    },
    'bt7m7kve': {
      'ru': 'Русский',
      'kk': 'Орысша',
    },
    'uile3si1': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // register
  {
    'njlb2ww1': {
      'ru': 'startapp',
      'kk': 'startapp',
    },
    't0o3hspl': {
      'ru': 'Регистрация',
      'kk': 'Тіркелу',
    },
    '6j6niyvz': {
      'ru': '',
      'kk': '',
    },
    'ismypoi7': {
      'ru': 'Адрес электронной почты',
      'kk': 'Электронды пошта',
    },
    '0lopeu5y': {
      'ru': '',
      'kk': '',
    },
    'imia05lv': {
      'ru': 'Придумайте пароль',
      'kk': 'Құпия сөз енгізіңіз',
    },
    'k85kggl4': {
      'ru': '',
      'kk': '',
    },
    'qugy5qh1': {
      'ru': 'Подтведите пароль',
      'kk': 'Құпия сөзді растаңыз',
    },
    'mkwevc89': {
      'ru': 'Зарегистрироваться',
      'kk': 'Тіркелу',
    },
    'uhz5l8wf': {
      'ru': 'Уже есть аккаунт?',
      'kk': 'Тіркелгенсізбе?',
    },
    '6x89kfww': {
      'ru': ' Войдите здесь',
      'kk': 'Жүйе кіру',
    },
    '369wdajk': {
      'ru': 'Қазақша',
      'kk': 'Казахский',
    },
    'ja6gvybg': {
      'ru': 'Русский',
      'kk': 'Орысша',
    },
    'tqfy474v': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // detail
  {
    'cu4kifh9': {
      'ru': 'Это ваш проект',
      'kk': 'Бұл сіздің жобаңыз',
    },
    'ga3yhnej': {
      'ru': 'Необходимые инвестиции:',
      'kk': 'Керекті қаражат:',
    },
    'dbhepi4e': {
      'ru': 'Описание',
      'kk': 'Анықтама',
    },
    'zdj5u2rr': {
      'ru': 'Написать в почту',
      'kk': 'Поштаға жазу',
    },
    'iz35tdej': {
      'ru': 'Стартап',
      'kk': 'Стартап',
    },
  },
  // profile
  {
    '7ytuacam': {
      'ru': 'Мои стартапы',
      'kk': 'Менің жобаларым',
    },
    'gzktls6h': {
      'ru': 'Избранное',
      'kk': 'Сақталғандар',
    },
    'b5kxgkqi': {
      'ru': 'Изменить профиль',
      'kk': 'Профильді өзгерту',
    },
    'aypg1jcc': {
      'ru': 'Темная тема',
      'kk': 'Қараңғы интерфейс',
    },
    '0jv6niif': {
      'ru': 'Выйти из аккаунта',
      'kk': 'Жүйеден шығу',
    },
    'uysh8cnd': {
      'ru': 'Обратная связь',
      'kk': 'Жүйеден шығу',
    },
    'p46ce8t5': {
      'ru': 'Русский',
      'kk': 'Орысша',
    },
    'b4re6947': {
      'ru': 'Қазақша',
      'kk': 'Казахский',
    },
    'y7jv0xby': {
      'ru': 'Профиль',
      'kk': 'Профиль',
    },
  },
  // favourite
  {
    'gn0mww5a': {
      'ru': 'Избранные',
      'kk': 'Сақталғандар',
    },
    '7ciyuxhr': {
      'ru': 'Избранное',
      'kk': 'Сақталғандар',
    },
  },
  // ep_Start
  {
    '1q6b0xoc': {
      'ru': 'Добавьте немного информации о себе (необязательно)',
      'kk': 'Өзініз туралы кішігірім ақпарат енгізің (міндетсіз)',
    },
    'sb0x8occ': {
      'ru': 'Загрузите фото',
      'kk': 'Сурет салу',
    },
    'qxgiopbn': {
      'ru': '',
      'kk': '',
    },
    'g1uffcsr': {
      'ru': 'Имя и Фамилия',
      'kk': 'Аты жөніңіз',
    },
    '01uap37d': {
      'ru': '',
      'kk': '',
    },
    '1ch8t6jj': {
      'ru': 'Номер телефона',
      'kk': 'Телефон нөміріңіз',
    },
    'd0hx9lwk': {
      'ru': 'Сохранить данные',
      'kk': 'Сақтау',
    },
  },
  // ep_main
  {
    'zbfd6juo': {
      'ru': 'Изменить информацию о себе',
      'kk': 'Ақпапатты өзгерту',
    },
    'cfcfc0xr': {
      'ru': 'Изменить фото',
      'kk': 'Суретті ауыстыру',
    },
    'ndskx32u': {
      'ru': '',
      'kk': '',
    },
    'rz0zgfs3': {
      'ru': '',
      'kk': '',
    },
    'qek8sf5c': {
      'ru': '',
      'kk': '',
    },
    'do7jagi4': {
      'ru': 'Сохранить данные',
      'kk': 'Сақтау',
    },
  },
  // user_projects
  {
    'ivmyfbzw': {
      'ru': 'Ваши проекты находятся здесь',
      'kk': 'Бұл жерде сіздің жобаларыңыз орналасқан',
    },
    'z4wnkl3a': {
      'ru': 'Мои проекты',
      'kk': 'Менің жобаларым',
    },
    '3tc1nd73': {
      'ru': 'Проекты',
      'kk': 'Жобалар',
    },
  },
  // change
  {
    'd15n07vj': {
      'ru': '',
      'kk': '',
    },
    '5w1i0njo': {
      'ru': 'Название проекта',
      'kk': 'Жоба тақырыбы',
    },
    'db6gqraa': {
      'ru': '',
      'kk': '',
    },
    'o93vk7yf': {
      'ru': 'Город',
      'kk': 'Қала',
    },
    'tepdxndx': {
      'ru': '',
      'kk': '',
    },
    'nav3w8l6': {
      'ru': 'Стадия проекта (кратко)',
      'kk': 'Жобаның жағдайы',
    },
    'tdme8ak8': {
      'ru': '',
      'kk': '',
    },
    'dpgb503p': {
      'ru': 'Необходимые инвестиции',
      'kk': 'Керекті қаражат',
    },
    'plopwsw0': {
      'ru': 'Номер телефона для связи',
      'kk': 'Байланыс телефоны',
    },
    'x8frp64c': {
      'ru': 'Опишите ваш проект',
      'kk': 'Жобаңызды сипаттаңыз',
    },
    '2zx0muiv': {
      'ru': 'Изменить',
      'kk': 'Жіберу',
    },
    'o8tgwyxa': {
      'ru': 'Изменить проект',
      'kk': 'Жобаны өзгерту',
    },
    '61xgdymr': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // new_detail
  {
    '63wuwpb3': {
      'ru': 'Название проекта',
      'kk': 'Жоба тақырыбы',
    },
    'gfvrdn6k': {
      'ru': 'Город',
      'kk': 'Қала',
    },
    '59dz0spj': {
      'ru': 'Стадия проекта (кратко)',
      'kk': 'Жобаның жағдайы',
    },
    'n5k8mpc5': {
      'ru': 'Сумма необходимых инвестиции',
      'kk': 'Керекті қаражат',
    },
    '94byk3hb': {
      'ru': 'Номер телефона для связи',
      'kk': 'Байланыс телефоны',
    },
    'chab7lqw': {
      'ru': 'Опишите ваш проект',
      'kk': 'Жобаңызды сипаттаңыз',
    },
    '0n7ipcz5': {
      'ru': 'Подать',
      'kk': 'Жіберу',
    },
    '4sy580uo': {
      'ru': 'Подать проект',
      'kk': 'Жобаны жіберу',
    },
    '5nqiekol': {
      'ru': 'Подать',
      'kk': 'Жіберу',
    },
  },
  // search
  {
    'tftepe2o': {
      'ru': 'Введите слово',
      'kk': 'Сөз енгізіңіз',
    },
    'u5ji6fcz': {
      'ru': 'Поиск проекта',
      'kk': 'Жобаны іздеу',
    },
    '8lnrhm9s': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // contact
  {
    'ti8xb86o': {
      'ru': 'Оцените приложение...',
      'kk': 'Қосымшаны бағалаңыз...',
    },
    'gpr6ufaz': {
      'ru':
          'Заметили ошибку в приложении? Помогите нам улучшить его, напишите нам свои пожелания!',
      'kk':
          'Қосымшада қатені байқадыңыз ба? Оны жақсартуға көмектесіңіз, тілектеріңізді жазыңыз!',
    },
    'c2pns47o': {
      'ru': 'Ваши пожелания...',
      'kk': 'Тілектеріңізді теріңіз...',
    },
    '4fej37y2': {
      'ru': 'Отправить',
      'kk': 'Жіберу',
    },
    'erewaeik': {
      'ru': 'startapp',
      'kk': 'startapp',
    },
    '60axdypc': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // news
  {
    'jjhsu1hb': {
      'ru': 'startapp',
      'kk': 'startapp',
    },
    'od9v7vwy': {
      'ru': 'Home',
      'kk': '',
    },
  },
  // Miscellaneous
  {
    'txexukgg': {
      'ru': 'Разрешите доступ к камере для продолжения',
      'kk': '',
    },
    'kexyb3pi': {
      'ru': 'Разрешите доступ к галерее для продолжения',
      'kk': '',
    },
    '98qy7wij': {
      'ru': 'Ошибка',
      'kk': 'Қате',
    },
    'y8cw1n4n': {
      'ru': 'Отправлено письмо с восстановлением!',
      'kk': 'Қалпына келтіру хаттамасы жіберілді!',
    },
    'daanedj8': {
      'ru': 'Необходима почта!',
      'kk': 'Міндетті түрде пошта қажет!',
    },
    '827gsf4g': {
      'ru': 'Введите номер начиная с +',
      'kk': '+ тен басталатын номер енгізіңіз',
    },
    'm3e53t7x': {
      'ru': 'Пароли не совпадают',
      'kk': 'Құпия сөздерді қайта енгізіңіз',
    },
    'dm6n9e8f': {
      'ru': 'Введите код с смс',
      'kk': 'СМС кодін теріңіз',
    },
    '4rhj6g2a': {
      'ru': 'Прошло много времени с последнего визита. Войдите заново',
      'kk': 'Соңғы сеанстан көп уақыт өтті. Қайта кіріңіз',
    },
    'jai10o5b': {
      'ru': 'Неверный формат',
      'kk': 'Қате формат',
    },
    'gbebyqan': {
      'ru': 'Загружается',
      'kk': 'Жүктелуде',
    },
    '8js505f1': {
      'ru': 'Успешно',
      'kk': 'Сәтті',
    },
    'frv5i7bv': {
      'ru': 'Не удалось загрузить',
      'kk': 'Жүктеуде қате болды',
    },
    'fe6qs4lv': {
      'ru': '',
      'kk': '',
    },
    'ixbv290o': {
      'ru': 'Выберите источник',
      'kk': 'Дерекқорды таңдаңыз',
    },
    '7pcteu3x': {
      'ru': 'Галерея',
      'kk': 'Галерея',
    },
    'fx6nmg43': {
      'ru': 'Фотогалерея',
      'kk': 'Бейнегалерея',
    },
    'l6eo2on9': {
      'ru': 'Видеогалерея',
      'kk': 'Бейнегалерея',
    },
    'ct2it227': {
      'ru': 'Камера',
      'kk': 'Камера',
    },
    'v57zzn24': {
      'ru': '',
      'kk': '',
    },
    'lxo83653': {
      'ru': '',
      'kk': '',
    },
    '47i6pajt': {
      'ru': '',
      'kk': '',
    },
    'aufpsibl': {
      'ru': '',
      'kk': '',
    },
  },
].reduce((a, b) => a..addAll(b));
