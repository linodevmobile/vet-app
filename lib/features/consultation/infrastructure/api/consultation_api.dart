abstract final class ConsultationApi {
  static const String collection = '/consultations';
  static const String aiProcessSection = '/ai/process-section';

  static String byId(String id) => '/consultation/$id';

  static String section(String id, String section) =>
      '/consultation/$id/sections/$section';

  static String pause(String id) => '/consultation/$id/pause';

  static String resume(String id) => '/consultation/$id/resume';

  static String sign(String id) => '/consultation/$id/sign';
}
