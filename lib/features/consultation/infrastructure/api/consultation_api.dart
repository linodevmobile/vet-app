abstract final class ConsultationApi {
  static const String process = '/consultation/process';

  static String byId(String id) => '/consultation/$id';

  static String pause(String id) => '/consultation/$id/pause';

  static String resume(String id) => '/consultation/$id/resume';

  static String sign(String id) => '/consultation/$id/sign';
}
