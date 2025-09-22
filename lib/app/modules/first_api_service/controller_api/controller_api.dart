// controllers/booking_controller.dart
import 'package:get/get.dart';

import '../../../models/doctor_details.dart';
import '../../../services/api_service.dart';



class BookingController extends GetxController {
  final BookingService _service = BookingService();

  var bookings = <booking_doctor>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchBookings();
    super.onInit();
  }

  void fetchBookings() async {
    try {
      isLoading(true);
      bookings.value = await _service.getBookings();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  // Future<void> addBooking(booking_doctor booking) async {
  //   final newBooking = await _service.createBooking(booking);
  //   bookings.add(newBooking);
  // }
  //
  // Future<void> editBooking(int id, booking_doctor booking) async {
  //   final updatedBooking = await _service.updateBooking(id, booking);
  //   int index = bookings.indexWhere((b) => b.id == id);
  //   if (index != -1) bookings[index] = updatedBooking;
  // }
  //
  // Future<void> removeBooking(int id) async {
  //   await _service.deleteBooking(id);
  //   bookings.removeWhere((b) => b.id == id);
  // }
}
