class LanguageEnum {
  static const String english = 'en';
  static const String arabic = 'ar';
}

class ThemeEnum {
  static const String light = 'light';
  static const String dark = 'dark';
}

enum SocialPlatformEnum { facebook, instagram }

enum PolicyType { knowUs, termsAndConditions, privacyPolicy }

enum ContactType { ad, complaints, join }

class SearchType {
  static const String cities = 'cities';
  static const String hotels = 'hotels';
  static const String airports = 'airports';
}

enum UserRole {
  admin('ADMIN'),
  member('MEMBER');

  final String value;

  const UserRole(this.value);
}

enum PolicyApprovalStatus {
  alwaysApproval('ALWAYS_APPROVAL_REQUIRED'),
  noApproval('NO_APPROVAL_REQUIRED'),
  violationApproval('RULES_VIOLATION_APPROVAL_REQUIRED');

  final String value;

  const PolicyApprovalStatus(this.value);
}

enum SearchQueryType {
  tripHop('TRIPHOP_PROPERTY_LOOKUP'),
  related('RELATED_PROPERTIES_LOOKUP');

  const SearchQueryType(this.value);
  final String value;
}

enum TripStatus {
  confirmed('CONFIRMED'),
  cancelled('CANCELLED');

  const TripStatus(this.value);
  final String value;
}

enum ApprovalStatus {
  pending('PENDING_APPROVAL'),
  approved('APPROVED'),
  declined('DISAPPROVED'),
  expired('EXPIRED');

  const ApprovalStatus(this.value);
  final String value;
}

enum DirectionInd {
  kReturn('Return'),
  oneWay('OneWay');

  const DirectionInd(this.value);
  final String value;
}

enum FilterEnum {
  topRated('TOP_RATED'),
  mostLikes('MOST_LIKES'),
  nearest('NEAREST');

  const FilterEnum(this.value);
  final String value;
}

enum GenderType {
  male('MALE'),
  female('FEMALE');

  final String value;

  const GenderType(this.value);
}

class AuthProviders {
  static const String google = 'google';
  static const String apple = 'apple';
  static const String phone = 'phone';
  static const String email = 'email';
}

class NotificationsType {
  static const String general = 'general';
  static const String provider = 'provider';
  static const String category = 'category';
}

enum AdEnum {
  provider('PROVIDER'),
  offer('OFFER'),
  category('CATEGORY');

  const AdEnum(this.value);
  final String value;
}

enum ProviderStatusEnum {
  active('ACTIVE'),
  pending('PENDING');

  const ProviderStatusEnum(this.value);
  final String value;
}
