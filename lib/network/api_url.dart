class ApiUrl {
  static late String mainUrl;

  static String get sandboxUrl => 'https://api.triphop.com:8787';
  static String get liveUrl => 'https://app.triphop.com:8787';

  ///auth
  static const String byEmail = '/access/company/by_email';
  static const String login = '/access/company/login';
  static const String forgotPassword = '/access/company/forget_password';
  static const String searchHistory = '/company/me/search_history?clear=false';
  static const String flightSearchHistory = '/company/me/flight_search_history?clear=false';
  static const String lookUp = '/company/booking/lookup';
  static const String travelers = '/company/user/list';
  static const String availability = '/company/hotel/availability';
  static const String userInfo = '/company/user/info';
  static const String recheck = '/company/hotel/recheck';
  static const String trips = '/company/me/all_bookings';
  static const String hotelsApprovals = '/company/hotel/booking/list_approver_approvals';
  static const String flightsApprovals = '/company/air/booking/list_approver_approvals';
  static const String approvalDetails = '/company/hotel/booking';
  static const String costCenters = '/company/me/get_active_cost_centers';
  static const String labels = '/company/me/get_active_labels';
  static const String requiresApproval = '/company/hotel/booking/requires_approval';
  static const String requestApproval = '/company/hotel/booking/request_approval';
  static const String requestApprovalWithMoreInfo = '/company/hotel/booking/approval_request_more_info';
}
