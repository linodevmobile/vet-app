abstract final class ConsultationApi {
  static const String process = '/consultation/process';

  static String pause(String id) => '/consultation/$id/pause';

  static String sign(String id) => '/consultation/$id/sign';
}
