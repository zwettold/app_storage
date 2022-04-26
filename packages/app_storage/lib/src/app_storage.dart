/// Hello there! 👋
///
/// Let's try to build a simple code-generator for shared preferences.
///
/// It should provide an interface for the safe and structured access to the
/// underlying preferences, while also providing other quality of life features,
/// such as: the ability to listen to changes, migrations, and more.
///
/// The starting point should be something along the lines of:
///
/// ```dart
/// part 'preferences.g.dart';
///
/// @AppStorage(
///   keyStrategy: const KeyStrategy(prefix: 'preferences', separator: '.'),
/// )
/// class _Preferences {
///   String? userStatus;
///
///   String locale = 'en';
///
///   @Stored(transformer: EnumTransformer<ThemeMode>())
///   ThemeMode theme = ThemeMode.system;
/// }
/// ```
///
/// Which will in turn generate the following code:
///
/// ```dart
/// class Preferences extends Storage<Preferences> {
///   const Preferences() : super(
///     keyStrategy: KeyStrategy(prefix: 'preferences', separator: '.'),
///   );
///
///   StorageItem<String?> get userStatus => super.getString('userStatus');
///
///   StorageItem<String> get locale => super.getString(
///     key: 'locale',
///     defaultValue: 'en',
///   );
///
///   StorageItem<ThemeMode> get theme => super.get<ThemeMode>(
///     key: 'theme',
///     defaultValue: ThemeMode.system,
///     transformer: EnumTransformer<ThemeMode>(),
///   );
/// }
/// ```
