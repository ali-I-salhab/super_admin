import 'package:flutter/material.dart';
import 'package:flutter_slide_drawer/flutter_slide_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/controller/hompage/homepagecontroller.dart';
import 'package:super_admin/core/class/handlingdataview.dart';
import 'package:super_admin/core/constants/route.dart';
import 'package:super_admin/core/functions/customappbar.dart';
import 'package:super_admin/view/Homepage/widgets/bottomnavbar.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.find();
    return SizedBox(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.red,
              child: SizedBox(
                height: 30.h,
                child: Stack(
                  children: [
                    // Container(
                    //   height: 200,
                    //   decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //       image: NetworkImage('https://via.placeholder.com/600x200'),
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                    Positioned(
                      bottom: 0,
                      left: 16,
                      child: Row(
                        children: [
                          // CircleAvatar(
                          //   radius: 50,
                          //   backgroundImage:
                          //       NetworkImage('https://via.placeholder.com/150'),
                          // ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'John Doe',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Software Engineer',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About Me',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'I am a passionate software engineer with experience in building mobile applications.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Contact Information',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('Email: john.doe@example.com'),
                  Text('Phone: +123 456 7890'),
                  SizedBox(height: 20),
                  // Divider(),
                  SizedBox(height: 10),
                  Text(
                    'Actions',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      await controller.serv.shared.clear();
                      Get.offAllNamed(AppRoutes.signup);
                      // Handle Edit Profile action
                    },
                    child: Text('Log out'),
                    // style: ElevatedButton.styleFrom(
                    //   minimumSize: Size(50, 50), // Make button full width
                    // ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
