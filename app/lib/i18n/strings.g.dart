
/*
 * Generated file. Do not edit.
 *
 * Locales: 5
 * Strings: 80 (16.0 per locale)
 *
 * Built on 2022-04-04 at 07:04 UTC
 */

import 'package:flutter/widgets.dart';

const AppLocale _baseLocale = AppLocale.en;
AppLocale _currLocale = _baseLocale;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale {
	en, // 'en' (base locale, fallback)
	es, // 'es'
	ja, // 'ja'
	ko, // 'ko'
	zh, // 'zh'
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn _t = _currLocale.translations;
_StringsEn get t => _t;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget.translations;
	}
}

class LocaleSettings {
	LocaleSettings._(); // no constructor

	/// Uses locale of the device, fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale useDeviceLocale() {
		final locale = AppLocaleUtils.findDeviceLocale();
		return setLocale(locale);
	}

	/// Sets locale
	/// Returns the locale which has been set.
	static AppLocale setLocale(AppLocale locale) {
		_currLocale = locale;
		_t = _currLocale.translations;

		if (WidgetsBinding.instance != null) {
			// force rebuild if TranslationProvider is used
			_translationProviderKey.currentState?.setLocale(_currLocale);
		}

		return _currLocale;
	}

	/// Sets locale using string tag (e.g. en_US, de-DE, fr)
	/// Fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale setLocaleRaw(String rawLocale) {
		final locale = AppLocaleUtils.parse(rawLocale);
		return setLocale(locale);
	}

	/// Gets current locale.
	static AppLocale get currentLocale {
		return _currLocale;
	}

	/// Gets base locale.
	static AppLocale get baseLocale {
		return _baseLocale;
	}

	/// Gets supported locales in string format.
	static List<String> get supportedLocalesRaw {
		return AppLocale.values
			.map((locale) => locale.languageTag)
			.toList();
	}

	/// Gets supported locales (as Locale objects) with base locale sorted first.
	static List<Locale> get supportedLocales {
		return AppLocale.values
			.map((locale) => locale.flutterLocale)
			.toList();
	}
}

/// Provides utility functions without any side effects.
class AppLocaleUtils {
	AppLocaleUtils._(); // no constructor

	/// Returns the locale of the device as the enum type.
	/// Fallbacks to base locale.
	static AppLocale findDeviceLocale() {
		final String? deviceLocale = WidgetsBinding.instance?.window.locale.toLanguageTag();
		if (deviceLocale != null) {
			final typedLocale = _selectLocale(deviceLocale);
			if (typedLocale != null) {
				return typedLocale;
			}
		}
		return _baseLocale;
	}

	/// Returns the enum type of the raw locale.
	/// Fallbacks to base locale.
	static AppLocale parse(String rawLocale) {
		return _selectLocale(rawLocale) ?? _baseLocale;
	}
}

// context enums

// interfaces generated as mixins

// translation instances

late _StringsEn _translationsEn = _StringsEn.build();
late _StringsEs _translationsEs = _StringsEs.build();
late _StringsJa _translationsJa = _StringsJa.build();
late _StringsKo _translationsKo = _StringsKo.build();
late _StringsZh _translationsZh = _StringsZh.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {

	/// Gets the translation instance managed by this library.
	/// [TranslationProvider] is using this instance.
	/// The plural resolvers are set via [LocaleSettings].
	_StringsEn get translations {
		switch (this) {
			case AppLocale.en: return _translationsEn;
			case AppLocale.es: return _translationsEs;
			case AppLocale.ja: return _translationsJa;
			case AppLocale.ko: return _translationsKo;
			case AppLocale.zh: return _translationsZh;
		}
	}

	/// Gets a new translation instance.
	/// [LocaleSettings] has no effect here.
	/// Suitable for dependency injection and unit tests.
	///
	/// Usage:
	/// final t = AppLocale.en.build(); // build
	/// String a = t.my.path; // access
	_StringsEn build() {
		switch (this) {
			case AppLocale.en: return _StringsEn.build();
			case AppLocale.es: return _StringsEs.build();
			case AppLocale.ja: return _StringsJa.build();
			case AppLocale.ko: return _StringsKo.build();
			case AppLocale.zh: return _StringsZh.build();
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.en: return 'en';
			case AppLocale.es: return 'es';
			case AppLocale.ja: return 'ja';
			case AppLocale.ko: return 'ko';
			case AppLocale.zh: return 'zh';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.en: return const Locale.fromSubtags(languageCode: 'en');
			case AppLocale.es: return const Locale.fromSubtags(languageCode: 'es');
			case AppLocale.ja: return const Locale.fromSubtags(languageCode: 'ja');
			case AppLocale.ko: return const Locale.fromSubtags(languageCode: 'ko');
			case AppLocale.zh: return const Locale.fromSubtags(languageCode: 'zh');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'en': return AppLocale.en;
			case 'es': return AppLocale.es;
			case 'ja': return AppLocale.ja;
			case 'ko': return AppLocale.ko;
			case 'zh': return AppLocale.zh;
			default: return null;
		}
	}
}

// wrappers

GlobalKey<_TranslationProviderState> _translationProviderKey = GlobalKey<_TranslationProviderState>();

class TranslationProvider extends StatefulWidget {
	TranslationProvider({required this.child}) : super(key: _translationProviderKey);

	final Widget child;

	@override
	_TranslationProviderState createState() => _TranslationProviderState();

	static _InheritedLocaleData of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget;
	}
}

class _TranslationProviderState extends State<TranslationProvider> {
	AppLocale locale = _currLocale;

	void setLocale(AppLocale newLocale) {
		setState(() {
			locale = newLocale;
		});
	}

	@override
	Widget build(BuildContext context) {
		return _InheritedLocaleData(
			locale: locale,
			child: widget.child,
		);
	}
}

class _InheritedLocaleData extends InheritedWidget {
	final AppLocale locale;
	Locale get flutterLocale => locale.flutterLocale; // shortcut
	final _StringsEn translations; // store translations to avoid switch call

	_InheritedLocaleData({required this.locale, required Widget child})
		: translations = locale.translations, super(child: child);

	@override
	bool updateShouldNotify(_InheritedLocaleData oldWidget) {
		return oldWidget.locale != locale;
	}
}

// pluralization feature not used

// helpers

final _localeRegex = RegExp(r'^([a-z]{2,8})?([_-]([A-Za-z]{4}))?([_-]?([A-Z]{2}|[0-9]{3}))?$');
AppLocale? _selectLocale(String localeRaw) {
	final match = _localeRegex.firstMatch(localeRaw);
	AppLocale? selected;
	if (match != null) {
		final language = match.group(1);
		final country = match.group(5);

		// match exactly
		selected = AppLocale.values
			.cast<AppLocale?>()
			.firstWhere((supported) => supported?.languageTag == localeRaw.replaceAll('_', '-'), orElse: () => null);

		if (selected == null && language != null) {
			// match language
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.startsWith(language) == true, orElse: () => null);
		}

		if (selected == null && country != null) {
			// match country
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.contains(country) == true, orElse: () => null);
		}
	}
	return selected;
}

// translations

// Path: <root>
class _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build();

	/// Access flat map
	dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	// ignore: unused_field
	late final _StringsEn _root = this;

	// Translations
	String get today => 'Today';
	String get tomorrow => 'Tomorrow';
	String get later => 'Later';
	String get theme => 'Theme';
	String get language => 'Language';
	String get rateUs => 'Rate Us';
	String get done => 'Done';
	String get start => 'Start';
	String get pause => 'Pause';
	String get week => 'Week';
	String get month => 'Month';
	String get year => 'Year';
	String get about => 'About';
	String get settings => 'Settings';
	String get reportIssue => 'Report Issue';
	String get privacyPolicy => 'Privacy Policy';
}

// Path: <root>
class _StringsEs implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEs.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	// ignore: unused_field
	@override late final _StringsEs _root = this;

	// Translations
	@override String get today => 'Hoy dia';
	@override String get tomorrow => 'Mañana';
	@override String get later => 'Lego';
	@override String get theme => 'Tema';
	@override String get language => 'Idioma';
	@override String get rateUs => 'Nos califica';
	@override String get done => 'Hecho';
	@override String get start => 'Comienzo';
	@override String get pause => 'Pausa';
	@override String get week => 'Semana';
	@override String get month => 'Mes';
	@override String get year => 'Año';
	@override String get about => 'Sobre';
	@override String get settings => 'Ajustes';
	@override String get reportIssue => 'Informar problema';
	@override String get privacyPolicy => 'Política de privacidad';
}

// Path: <root>
class _StringsJa implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsJa.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	// ignore: unused_field
	@override late final _StringsJa _root = this;

	// Translations
	@override String get today => '今日';
	@override String get tomorrow => '明日';
	@override String get later => '後で';
	@override String get theme => 'テーマ';
	@override String get language => '言語';
	@override String get rateUs => '私たちを評価してください';
	@override String get done => '終わり';
	@override String get start => '始める';
	@override String get pause => '一時停止';
	@override String get week => '週';
	@override String get month => '月';
	@override String get year => '年';
	@override String get about => '就いては';
	@override String get settings => '設定';
	@override String get reportIssue => 'レポートの問題';
	@override String get privacyPolicy => 'プライバシーポリシー';
}

// Path: <root>
class _StringsKo implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsKo.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	// ignore: unused_field
	@override late final _StringsKo _root = this;

	// Translations
	@override String get today => '오늘';
	@override String get tomorrow => '내일';
	@override String get later => '나중에';
	@override String get theme => '테마';
	@override String get language => '언어';
	@override String get rateUs => '평가해 주세요';
	@override String get done => '완료';
	@override String get start => '시작';
	@override String get pause => '정지';
	@override String get week => '주';
	@override String get month => '월';
	@override String get year => '년';
	@override String get about => '소개';
	@override String get settings => '설정';
	@override String get reportIssue => '문제 보고';
	@override String get privacyPolicy => '프라이버시 정책';
}

// Path: <root>
class _StringsZh implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsZh.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	// ignore: unused_field
	@override late final _StringsZh _root = this;

	// Translations
	@override String get today => '今天';
	@override String get tomorrow => '明天';
	@override String get later => '之后';
	@override String get theme => '主题';
	@override String get language => '语言';
	@override String get rateUs => '评价我们';
	@override String get done => '完毕';
	@override String get start => '开始';
	@override String get pause => '暂停';
	@override String get week => '星期';
	@override String get month => '月';
	@override String get year => '年';
	@override String get about => '关于';
	@override String get settings => '设置';
	@override String get reportIssue => '报告问题';
	@override String get privacyPolicy => '隐私政策';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	Map<String, dynamic> _buildFlatMap() {
		return {
			'today': 'Today',
			'tomorrow': 'Tomorrow',
			'later': 'Later',
			'theme': 'Theme',
			'language': 'Language',
			'rateUs': 'Rate Us',
			'done': 'Done',
			'start': 'Start',
			'pause': 'Pause',
			'week': 'Week',
			'month': 'Month',
			'year': 'Year',
			'about': 'About',
			'settings': 'Settings',
			'reportIssue': 'Report Issue',
			'privacyPolicy': 'Privacy Policy',
		};
	}
}

extension on _StringsEs {
	Map<String, dynamic> _buildFlatMap() {
		return {
			'today': 'Hoy dia',
			'tomorrow': 'Mañana',
			'later': 'Lego',
			'theme': 'Tema',
			'language': 'Idioma',
			'rateUs': 'Nos califica',
			'done': 'Hecho',
			'start': 'Comienzo',
			'pause': 'Pausa',
			'week': 'Semana',
			'month': 'Mes',
			'year': 'Año',
			'about': 'Sobre',
			'settings': 'Ajustes',
			'reportIssue': 'Informar problema',
			'privacyPolicy': 'Política de privacidad',
		};
	}
}

extension on _StringsJa {
	Map<String, dynamic> _buildFlatMap() {
		return {
			'today': '今日',
			'tomorrow': '明日',
			'later': '後で',
			'theme': 'テーマ',
			'language': '言語',
			'rateUs': '私たちを評価してください',
			'done': '終わり',
			'start': '始める',
			'pause': '一時停止',
			'week': '週',
			'month': '月',
			'year': '年',
			'about': '就いては',
			'settings': '設定',
			'reportIssue': 'レポートの問題',
			'privacyPolicy': 'プライバシーポリシー',
		};
	}
}

extension on _StringsKo {
	Map<String, dynamic> _buildFlatMap() {
		return {
			'today': '오늘',
			'tomorrow': '내일',
			'later': '나중에',
			'theme': '테마',
			'language': '언어',
			'rateUs': '평가해 주세요',
			'done': '완료',
			'start': '시작',
			'pause': '정지',
			'week': '주',
			'month': '월',
			'year': '년',
			'about': '소개',
			'settings': '설정',
			'reportIssue': '문제 보고',
			'privacyPolicy': '프라이버시 정책',
		};
	}
}

extension on _StringsZh {
	Map<String, dynamic> _buildFlatMap() {
		return {
			'today': '今天',
			'tomorrow': '明天',
			'later': '之后',
			'theme': '主题',
			'language': '语言',
			'rateUs': '评价我们',
			'done': '完毕',
			'start': '开始',
			'pause': '暂停',
			'week': '星期',
			'month': '月',
			'year': '年',
			'about': '关于',
			'settings': '设置',
			'reportIssue': '报告问题',
			'privacyPolicy': '隐私政策',
		};
	}
}
