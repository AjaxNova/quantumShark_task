import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _baseUrl =
      "https://66lm3itzuf.execute-api.us-east-1.amazonaws.com";

  Future<Response> bookAppointment({
    required String patientID,
    required String name,
    required String appointmentDate,
    required String time,
    required String type,
  }) async {
    final String endpoint = '$_baseUrl/patient/booking';
    final Map<String, dynamic> body = {
      "patientID": patientID,
      "name": name,
      "appointmentDate": appointmentDate,
      "time": time,
      "type": type,
    };

    try {
      final response = await _dio.post(endpoint, data: body);
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('Failed to book appointment: ${e.response?.data}');
      } else {
        throw Exception('Failed to book appointment: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to book appointment: $e');
    }
  }
}
