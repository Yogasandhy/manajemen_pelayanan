// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Manajemen Pelayanan';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get profileTitle => 'Profil';

  @override
  String get serviceNavLabel => 'Layanan';

  @override
  String get profileNavLabel => 'Profil';

  @override
  String get loginSubtitle =>
      'Masuk untuk memantau dan mengatur layanan harian.';

  @override
  String get usernameLabel => 'Username';

  @override
  String get passwordLabel => 'Password';

  @override
  String get loginButton => 'Masuk';

  @override
  String get loginDemoNote => 'Demo sederhana: username dan password bebas.';

  @override
  String get addService => 'Tambah Layanan';

  @override
  String get serviceListTitle => 'Daftar Layanan';

  @override
  String get serviceNameLabel => 'Nama layanan';

  @override
  String get descriptionLabel => 'Keterangan';

  @override
  String get saveButton => 'Simpan';

  @override
  String get statusLabel => 'Status';

  @override
  String get deleteTooltip => 'Hapus';

  @override
  String get emptyServiceMessage =>
      'Belum ada layanan. Tambahkan layanan baru dulu.';

  @override
  String get missingDescription => 'Belum ada keterangan.';

  @override
  String get totalLabel => 'Total';

  @override
  String get processLabel => 'Proses';

  @override
  String get doneLabel => 'Selesai';

  @override
  String get pendingStatus => 'Menunggu';

  @override
  String get inProgressStatus => 'Diproses';

  @override
  String get completedStatus => 'Selesai';

  @override
  String get cancelledStatus => 'Batal';

  @override
  String get adminName => 'Admin Pelayanan';

  @override
  String get adminRole => 'Operator layanan masyarakat';

  @override
  String get pendingServiceCount => 'Layanan menunggu';

  @override
  String get inProgressServiceCount => 'Sedang diproses';

  @override
  String get completedServiceCount => 'Selesai';

  @override
  String get cancelledServiceCount => 'Dibatalkan';

  @override
  String get logoutButton => 'Keluar';
}
