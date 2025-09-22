// services/booking_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/doctor_details.dart';


class BookingService {
  static const baseUrl = "http://10.155.7.168:8000/doctor_details/doctor_addetails/";

  /// GET all bookings
  Future<List<booking_doctor>> getBookings() async {
    final response = await http.get(Uri.parse("$baseUrl"));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => booking_doctor.fromJson(e)).toList();
    } else {
      throw Exception("Failed to fetch bookings");
    }
  }

//   /// POST (Create)
//   Future<booking_doctor> createBooking(booking_doctor booking) async {
//     final response = await http.post(
//       Uri.parse("$baseUrl"),
//       headers: {"Content-Type": "application/json"},
//       body: json.encode(booking.toJson()),
//     );
//     if (response.statusCode == 201 || response.statusCode == 200) {
//       return booking_doctor.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to create booking");
//     }
//   }
//
//   /// PUT (Update)
//   Future<booking_doctor> updateBooking(int id, booking_doctor booking) async {
//     final response = await http.put(
//       Uri.parse("$baseUrl/doctor_addetails/$id/"),
//       headers: {"Content-Type": "application/json"},
//       body: json.encode(booking.toJson()),
//     );
//     if (response.statusCode == 200) {
//       return booking_doctor.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to update booking");
//     }
//   }
//
//   /// DELETE
//   Future<void> deleteBooking(int id) async {
//     final response = await http.delete(Uri.parse("$baseUrl/doctor_addetails/$id/"));
//     if (response.statusCode != 204 && response.statusCode != 200) {
//       throw Exception("Failed to delete booking");
//     }
//   }
}
