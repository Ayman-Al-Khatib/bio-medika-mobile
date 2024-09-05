class AppLink {
  static const String ipConfig = '192.168.115.221:8000';
  // static const String server = 'https://bio-medica-app.000webhostapp.com/api';
  static const String server = 'http://$ipConfig/api';

  //! prefix path image
  // static const String prefixPathImage = 'https://bio-medica-app.000webhostapp.com/';
  static const String prefixPathImage = 'http://$ipConfig/';

  //! role
  static const String pharmacist = '$server/pharmacist';

  //! Account Information
  static const String accountInformation = '$pharmacist/update-pharmacist';

  //! category
  static const String category = '$server/get-all-categories';

  //! ====================Auth====================
  static const String signup = '$pharmacist/signup';
  static const String login = '$pharmacist/login';

  //! ==================== Forget Password ====================
  static const String sendCode = "$server/send-code";

  //! ==================== OTP ====================
  static const String checkCode = "$server/check-code";

  //! ==================== Reset Password ====================
  static const String resetPassword = "$server/check-code-reset-password";

  //! ====================  Get Categories ====================
  static const String getAllCategories = "$server/get-all-categories";

  //! ====================  Get Drug <=> For One Category ====================
  static const String drugCategory = "$server/get-category-medications";

  //! ====================   Drug  ====================
  static const String getOneMedication = "$server/get-one-medication";
  static const String underOneMonth = "$server/get-under-one-month-sale";
  static const String underThreeMonth = "$server/get-under-three-months-sale";
  static const String mostPopular = "$server/most-popular-medications";
  static const String dailySale = "$server/get-daily-sale-medications";
  static const String getAllMedication = "$server/get-all-medications";

  //! ====================  Favorite ====================
  static const String addFavorite = "$pharmacist/add-medication-to-favorite";
  static const String removeFavorite = "$pharmacist/remove-medication-from-favorite";
  static const String getFavorite = "$pharmacist/get-favorite";

  //!
  static const String createOrder = "$pharmacist/make-order";
  static const String getAllOrder = "$server/get-pharmacist-orders";
  static const String cancelOrder = "$server/cancel-order";

  //!Notifications
  static const String getNotifications = "$pharmacist/notifications";
}
