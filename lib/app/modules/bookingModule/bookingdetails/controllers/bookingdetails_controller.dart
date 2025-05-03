import 'package:bookdubaisafari/app/data/getModels/MyBookings.dart';
import 'package:bookdubaisafari/app/res/exports.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class BookingdetailsController extends GetxController {
  Mybooking mybooking = Mybooking();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    mybooking = Get.arguments[0];
  }

  Future<pw.Document> createPdf() async {
    final pdf = pw.Document();
    final ByteData imageData = await rootBundle.load(logo);
    final Uint8List imageBytes = imageData.buffer.asUint8List();
    var date = DateFormat.yMMMEd().format(mybooking.date!);
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Padding(
              padding: const pw.EdgeInsets.all(16),
              child: pw.Center(
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                    pw.Image(pw.MemoryImage(imageBytes),
                        height: 100, width: 100),
                    pw.Text("RAH Tourim",
                        style: const pw.TextStyle(
                          fontSize: 15,
                        )),
                    pw.SizedBox(height: 30),
                    pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.RichText(
                            text: pw.TextSpan(
                              children: [
                                pw.TextSpan(
                                  text: "Reference No: ", // The "Title:" part
                                  style: pw.TextStyle(
                                      fontWeight:
                                          pw.FontWeight.bold), // Make it bold
                                ),
                                pw.TextSpan(
                                  text: mybooking
                                      .referenceId, // The dynamic title part
                                  style: pw.TextStyle(
                                      fontWeight: pw
                                          .FontWeight.normal), // Keep it normal
                                ),
                              ],
                            ),
                          ),
                          pw.RichText(
                            text: pw.TextSpan(
                              children: [
                                pw.TextSpan(
                                  text:
                                      "Slip Generated On: ", // The "Title:" part
                                  style: pw.TextStyle(
                                      fontWeight:
                                          pw.FontWeight.bold), // Make it bold
                                ),
                                pw.TextSpan(
                                  text: DateFormat.yMMMEd().format(
                                      DateTime.now()), // The dynamic title part
                                  style: pw.TextStyle(
                                      fontWeight: pw
                                          .FontWeight.normal), // Keep it normal
                                ),
                              ],
                            ),
                          ),
                          pw.RichText(
                            text: pw.TextSpan(
                              children: [
                                pw.TextSpan(
                                  text: "Booking Status: ", // The "Title:" part
                                  style: pw.TextStyle(
                                      fontWeight:
                                          pw.FontWeight.bold), // Make it bold
                                ),
                                pw.TextSpan(
                                  text: mybooking
                                      .status, // The dynamic title part
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 14,
                                      color: PdfColors.green), // Keep it normal
                                ),
                              ],
                            ),
                          ),
                        ]),
                    pw.SizedBox(height: 30),
                    pw.Text("Booking Information",
                        style: pw.TextStyle(
                            fontSize: 16, fontWeight: pw.FontWeight.bold)),
                    // pw.Text(
                    //     "Slip generated on: ${DateFormat.yMMMEd().format(DateTime.now())}"),
                    pw.SizedBox(height: 10),
                    pw.Container(
                        width: double.infinity,
                        padding: const pw.EdgeInsets.all(10),
                        decoration: pw.BoxDecoration(
                            borderRadius: pw.BorderRadius.circular(10),
                            border: pw.Border.all(color: PdfColors.grey300)),
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.RichText(
                                text: pw.TextSpan(
                                  children: [
                                    pw.TextSpan(
                                      text: "Title: ", // The "Title:" part
                                      style: pw.TextStyle(
                                          fontWeight: pw
                                              .FontWeight.bold), // Make it bold
                                    ),
                                    pw.TextSpan(
                                      text: mybooking
                                          .title, // The dynamic title part
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight
                                              .normal), // Keep it normal
                                    ),
                                  ],
                                ),
                              ),
                              pw.SizedBox(height: 10),
                              pw.RichText(
                                text: pw.TextSpan(
                                  children: [
                                    pw.TextSpan(
                                      text: "Full Name: ", // The "Title:" part
                                      style: pw.TextStyle(
                                          fontWeight: pw
                                              .FontWeight.bold), // Make it bold
                                    ),
                                    pw.TextSpan(
                                      text:
                                          "${mybooking.firstName} ${mybooking.lastName}", // The dynamic title part
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight
                                              .normal), // Keep it normal
                                    ),
                                  ],
                                ),
                              ),
                              pw.SizedBox(height: 10),
                              pw.RichText(
                                text: pw.TextSpan(
                                  children: [
                                    pw.TextSpan(
                                      text: "Email: ", // The "Title:" part
                                      style: pw.TextStyle(
                                          fontWeight: pw
                                              .FontWeight.bold), // Make it bold
                                    ),
                                    pw.TextSpan(
                                      text:
                                          "${mybooking.email}", // The dynamic title part
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight
                                              .normal), // Keep it normal
                                    ),
                                  ],
                                ),
                              ),
                              pw.SizedBox(height: 10),
                              pw.RichText(
                                text: pw.TextSpan(
                                  children: [
                                    pw.TextSpan(
                                      text:
                                          "Mobile Number: ", // The "Title:" part
                                      style: pw.TextStyle(
                                          fontWeight: pw
                                              .FontWeight.bold), // Make it bold
                                    ),
                                    pw.TextSpan(
                                      text:
                                          "${mybooking.phone}", // The dynamic title part
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight
                                              .normal), // Keep it normal
                                    ),
                                  ],
                                ),
                              ),
                              pw.SizedBox(height: 10),
                              pw.RichText(
                                text: pw.TextSpan(
                                  children: [
                                    pw.TextSpan(
                                      text: "Country: ", // The "Title:" part
                                      style: pw.TextStyle(
                                          fontWeight: pw
                                              .FontWeight.bold), // Make it bold
                                    ),
                                    pw.TextSpan(
                                      text:
                                          "${mybooking.nationality}", // The dynamic title part
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight
                                              .normal), // Keep it normal
                                    ),
                                  ],
                                ),
                              ),
                              pw.SizedBox(height: 10),
                              pw.RichText(
                                text: pw.TextSpan(
                                  children: [
                                    pw.TextSpan(
                                      text:
                                          "Booking Date: ", // The "Title:" part
                                      style: pw.TextStyle(
                                          fontWeight: pw
                                              .FontWeight.bold), // Make it bold
                                    ),
                                    pw.TextSpan(
                                      text: date, // The dynamic title part
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight
                                              .normal), // Keep it normal
                                    ),
                                  ],
                                ),
                              ),
                              pw.SizedBox(height: 10),
                              pw.RichText(
                                text: pw.TextSpan(
                                  children: [
                                    pw.TextSpan(
                                      text:
                                          "Participants: ", // The "Title:" part
                                      style: pw.TextStyle(
                                          fontWeight: pw
                                              .FontWeight.bold), // Make it bold
                                    ),
                                    pw.TextSpan(
                                      text:
                                          "${int.parse(mybooking.orderItems!.first.adult.toString()) != 0 ? "${mybooking.orderItems!.first.adult.toString()} ${"Adults".tr} ," : ""} ${int.parse(mybooking.orderItems!.first.child.toString()) != 0 ? "${int.parse(mybooking.orderItems!.first.adult.toString())} ${"Childs".tr} ," : ""} ${int.parse(mybooking.orderItems!.first.infant.toString()) != 0 ? "${int.parse(mybooking.orderItems!.first.infant.toString())} Infants" : ""}", // The dynamic title part
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight
                                              .normal), // Keep it normal
                                    ),
                                  ],
                                ),
                              ),
                              pw.SizedBox(height: 10),
                              pw.RichText(
                                text: pw.TextSpan(
                                  children: [
                                    pw.TextSpan(
                                      text:
                                          "Pickup Location: ", // The "Title:" part
                                      style: pw.TextStyle(
                                          fontWeight: pw
                                              .FontWeight.bold), // Make it bold
                                    ),
                                    pw.TextSpan(
                                      text: mybooking
                                          .pickupLocation, // The dynamic title part
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight
                                              .normal), // Keep it normal
                                    ),
                                  ],
                                ),
                              ),
                              pw.SizedBox(height: 10),
                              pw.RichText(
                                text: pw.TextSpan(
                                  children: [
                                    pw.TextSpan(
                                      text:
                                          "Acticvity Name:", // The "Title:" part
                                      style: pw.TextStyle(
                                          fontWeight: pw
                                              .FontWeight.bold), // Make it bold
                                    ),
                                    pw.TextSpan(
                                      text: mybooking
                                          .activityName, // The dynamic title part
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight
                                              .normal), // Keep it normal
                                    ),
                                  ],
                                ),
                              ),
                              pw.SizedBox(height: 10),
                              pw.RichText(
                                text: pw.TextSpan(
                                  children: [
                                    pw.TextSpan(
                                      text:
                                          "Package Booked:", // The "Title:" part
                                      style: pw.TextStyle(
                                          fontWeight: pw
                                              .FontWeight.bold), // Make it bold
                                    ),
                                    pw.TextSpan(
                                      text: mybooking.orderItems!.first
                                          .packageTitle, // The dynamic title part
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight
                                              .normal), // Keep it normal
                                    ),
                                  ],
                                ),
                              ),
                              pw.SizedBox(height: 10),
                              pw.RichText(
                                text: pw.TextSpan(
                                  children: [
                                    pw.TextSpan(
                                      text:
                                          "Package Type: ", // The "Title:" part
                                      style: pw.TextStyle(
                                          fontWeight: pw
                                              .FontWeight.bold), // Make it bold
                                    ),
                                    pw.TextSpan(
                                      text: mybooking.orderItems!.first
                                          .packageCategory, // The dynamic title part
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight
                                              .normal), // Keep it normal
                                    ),
                                  ],
                                ),
                              ),
                              pw.SizedBox(height: 10),
                              pw.Divider(color: PdfColors.grey),
                              pw.Row(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceBetween,
                                  children: [
                                    pw.Text(
                                      "Total Amount Paid:", // The "Title:" part
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight.bold,
                                          color: PdfColors.red,
                                          fontSize: 16), // Make it bold
                                    ),
                                    pw.Text(
                                      "AED ${mybooking.totalAmount.toString()}", // The "Title:" part
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight.bold,
                                          color: PdfColors.red,
                                          fontSize: 16), // Make it bold
                                    ),
                                  ]),
                            ])),
                    pw.SizedBox(height: 10),
                    pw.Text(
                      "We have received the payment of AED ${mybooking.totalAmount}", // The dynamic title part
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.normal), // Keep it normal
                    ),
                    pw.SizedBox(height: 10),
                    pw.Text(
                      "This is not an invoice for VAT purposes.", // The dynamic title part
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.normal), // Keep it normal
                    ),
                    pw.Text(
                      "Please note that this document is proof of payment only.", // The dynamic title part
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.normal), // Keep it normal
                    ),
                    pw.SizedBox(height: 20),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                "RAH Tourism LLC", // The "Title:" part
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 12), // Make it bold
                              ),
                              pw.Text(
                                "Port Saeed , Deira", // The "Title:" part
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.normal,
                                    fontSize: 12), // Make it bold
                              ),
                              pw.Text(
                                "Office 714, Makateb Building", // The "Title:" part
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.normal,
                                    fontSize: 12), // Make it bold
                              ),
                              pw.Text(
                                "Dubai U.A.E", // The "Title:" part
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.normal,
                                    fontSize: 12), // Make it bold
                              ),
                            ]),
                        pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                "Phone: +971 52 933 1100", // The "Title:" part
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.normal,
                                    fontSize: 12), // Make it bold
                              ),
                              pw.Text(
                                "bookings@rahtours.ae", // The "Title:" part
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.normal,
                                    fontSize: 12), // Make it bold
                              ),
                              pw.Text(
                                "www.rahtours.ae", // The "Title:" part
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.normal,
                                    fontSize: 12), // Make it bold
                              ),
                            ]),
                        pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                "RAH Tourism LLC", // The "Title:" part
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.normal,
                                    fontSize: 12), // Make it bold
                              ),
                            ])
                      ],
                    ),
                  ])));
        },
      ),
    );

    return pdf;
  }

  Future<File> savePdf(pw.Document pdf) async {
    // Get the directory for saving the file
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/booking.pdf';

    // Save the PDF file
    final file = File(path);
    await file.writeAsBytes(await pdf.save());

    return file;
  }

  Future<void> openPdf(File file) async {
    // Open the file using the `open_file` package
    final result = await OpenFile.open(file.path);

    // Check if the file was opened successfully
    if (result.type != ResultType.done) {
      print("Failed to open the file: ${result.message}");
    }
  }
}
