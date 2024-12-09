import 'package:doctor/features/st/st_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TopDocView extends StatefulWidget {
  const TopDocView({super.key});

  @override
  State<TopDocView> createState() => _TopDocViewState();
}

class _TopDocViewState extends State<TopDocView> {
  StController controller = Get.put(StController());

  @override
  void initState() {
    controller.getTopDoctors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Top Doctors'),
            centerTitle: true,
          ),
          body: controller.doctorData.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width > 600
                          ? 3
                          : 2, // Adjust columns for responsiveness
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 3.8 / 4,
                    ),
                    itemCount: controller.doctorData.length,
                    itemBuilder: (context, index) {
                      final doctor = controller.doctorData[index];
                      return DoctorCard(doctor: doctor);
                    },
                  ),
                ),
        );
      }
    );
  }
}

class DoctorCard extends StatelessWidget {
  final Map<String, dynamic> doctor;

  const DoctorCard({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 22,),
            Center(
              child: CircleAvatar(
                  radius: 71,
                  backgroundImage:
                  NetworkImage(doctor['doctor_image'])),
            ),
            SizedBox(height: 22,),
             //   child: Image.network(doctor['doctor_image'] ?? '', height: 100, width: 100)),
            Text(
              doctor['doctor_name'] ?? 'Unknown',
              style: GoogleFonts.cairo(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            Text(
              doctor['doctor_qualifications'] ?? '',
              style: GoogleFonts.cairo(
                fontSize: 14,
                color: Colors.grey[600],
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 18),
                    SizedBox(width: 4),
                    Text(
                      doctor['average_rate']?.toString() ?? '0',
                      style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  '${doctor['total_reviews'] ?? 0} Reviews',
                  style: GoogleFonts.cairo(
                    fontSize: 12,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
