abstract final class PatientsApi {
  static const String base = '/patients';
  static const String favorites = '/patients/favorites';

  static String byId(String id) => '/patients/$id';
}
