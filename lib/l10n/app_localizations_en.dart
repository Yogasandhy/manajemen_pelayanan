// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Service Management';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get profileTitle => 'Profile';

  @override
  String get serviceNavLabel => 'Services';

  @override
  String get profileNavLabel => 'Profile';

  @override
  String get loginSubtitle => 'Sign in to monitor and manage daily services.';

  @override
  String get usernameLabel => 'Username';

  @override
  String get passwordLabel => 'Password';

  @override
  String get loginButton => 'Sign in';

  @override
  String get loginDemoNote =>
      'Simple demo: any username and password will work.';

  @override
  String get addService => 'Add Service';

  @override
  String get serviceListTitle => 'Service List';

  @override
  String get serviceNameLabel => 'Service name';

  @override
  String get descriptionLabel => 'Description';

  @override
  String get saveButton => 'Save';

  @override
  String get statusLabel => 'Status';

  @override
  String get deleteTooltip => 'Delete';

  @override
  String get emptyServiceMessage => 'No services yet. Add a new service first.';

  @override
  String get missingDescription => 'No description yet.';

  @override
  String get totalLabel => 'Total';

  @override
  String get processLabel => 'In progress';

  @override
  String get doneLabel => 'Done';

  @override
  String get pendingStatus => 'Pending';

  @override
  String get inProgressStatus => 'In progress';

  @override
  String get completedStatus => 'Done';

  @override
  String get cancelledStatus => 'Cancelled';

  @override
  String get adminName => 'Service Admin';

  @override
  String get adminRole => 'Public service operator';

  @override
  String get pendingServiceCount => 'Pending services';

  @override
  String get inProgressServiceCount => 'In progress';

  @override
  String get completedServiceCount => 'Completed';

  @override
  String get cancelledServiceCount => 'Cancelled';

  @override
  String get logoutButton => 'Sign out';
}
