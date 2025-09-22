// // pages/booking_page.dart
// import 'package:demo_flutter_project/app/modules/first_api_service/controller_api/songs_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../models/doctor_details.dart';
// import '../controller_api/controller_api.dart';
//
//
// class BookingPage extends StatelessWidget {
//   final songsshowcontroller c = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Doctor Bookings")),
//       body: Obx(() {
//         if (c.isloading.value) {
//           return Center(child: CircularProgressIndicator());
//         }
//         return ListView.builder(
//           itemCount: c.songss.length,
//           itemBuilder: (_, index) {
//             final booking = c.songss[index];
//             return ListTile(
//               title: Text(booking.title ?? "No name"),
//               subtitle: Text("${booking.artists ?? ""}"),
//               // trailing: Row(
//               //   mainAxisSize: MainAxisSize.min,
//               //   children: [
//                   // IconButton(
//                   //   icon: Icon(Icons.edit, color: Colors.orange),
//                   //   onPressed: () {
//                   //     // Example: update booking
//                   //     c.editBooking(
//                   //       booking.id!,
//                   //       booking_doctor(
//                   //         id: booking.id,
//                   //         doctorName: "Updated Doctor",
//                   //         bookingDate: booking.bookingDate,
//                   //         bookingTime: booking.bookingTime,
//                   //       ),
//                   //     );
//                   //   },
//                   // ),
//                   // IconButton(
//                   //   icon: Icon(Icons.delete, color: Colors.red),
//                   //   onPressed: () => c.removeBooking(booking.id!),
//                   // ),
//                 // ],
//               );
//
//           },
//         );
//       }),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {
//       //     c.addBooking(
//       //       booking_doctor(
//       //         doctorName: "New Doctor",
//       //         bookingDate: "2025-09-03",
//       //         bookingTime: "10:00 AM",
//       //       ),
//       //     );
//       //   },
//       //   child: Icon(Icons.add),
//       // ),
//     );
//   }
// }

import 'package:demo_flutter_project/app/modules/first_api_service/controller_api/songs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingPage extends StatelessWidget {
  final songsshowcontroller c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Songs List")),
      body: Obx(() {
        if (c.isloading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (c.songsList.isEmpty) {
          return Center(child: Text("No songs found"));
        }
        return ListView.builder(
          itemCount: c.songsList.length,
          itemBuilder: (_, index) {
            final song = c.songsList[index];
            return ListTile(
              leading: song.coverImage != null
                  ? Image.network(song.coverImage!, width: 50, height: 50, fit: BoxFit.cover)
                  : Icon(Icons.music_note),
              title: Text(song.title ?? "No Title"),
              subtitle: Text(
                song.artists != null && song.artists!.isNotEmpty
                    ? song.artists![0].artiestName ?? ""
                    : "No Artist",
              ),
              trailing: Text("❤️ ${song.likesCount ?? 0}"),
            );
          },
        );
      }),
    );
  }
}
