class FlavorConfig {
  final String name;
  final String mainUrl;

  static FlavorConfig? _instance;

  factory FlavorConfig({
    required String name,
    required String mainUrl,
  }) {
    _instance ??= FlavorConfig._internal(name, mainUrl);
    return _instance!;
  }

  FlavorConfig._internal(this.name, this.mainUrl);

  static FlavorConfig get instance {
    return _instance!;
  }

  static bool isLive() => _instance?.name == "live";
  static bool isSandbox() => _instance?.name == "sandbox";
}
