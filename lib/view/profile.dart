import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';
import 'package:super_admin/core/constants/imageassets.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          // margin: EdgeInsets.only(top: 20.sp),
          foregroundDecoration:
              BoxDecoration(color: Colors.black.withOpacity(0.4)),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    ImageAssets.background,
                  ),
                  fit: BoxFit.cover)),
        ),
        Container(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                CircleAvatar(
                  radius: 40.sp,
                  backgroundImage: AssetImage(
                    ImageAssets.profile,
                  ),
                ).animate().flipV(),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 60.h,
                  width: double.infinity,
                  padding: EdgeInsets.all(10.sp),
                  color: Colors.black.withOpacity(0.3),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.sp),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(30.sp),
                                topLeft: Radius.circular(30.sp))),
                        child: ListTile(
                          trailing: Text("trailing"),
                          title: Text("profile"),
                          leading: Icon(
                            Icons.person_3_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.sp),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(30.sp),
                                topLeft: Radius.circular(30.sp))),
                        child: ListTile(
                          trailing: Text("trailing"),
                          title: Text("Location"),
                          leading: Icon(
                            Ionicons.locate,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.sp),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(30.sp),
                                topLeft: Radius.circular(30.sp))),
                        child: ListTile(
                          trailing: Text("trailing"),
                          title: Text("language"),
                          leading: Icon(
                            Icons.language_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.sp),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(30.sp),
                                topLeft: Radius.circular(30.sp))),
                        child: ListTile(
                          trailing: Text("trailing"),
                          title: Text("Notifications"),
                          leading: Icon(
                            Icons.notifications_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ].animate().flipH(),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
