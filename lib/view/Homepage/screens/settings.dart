import 'package:flutter/material.dart';
import 'package:flutter_slide_drawer/flutter_slide_widget.dart';
import 'package:get/get.dart';
import 'package:super_admin/controller/hompage/homepagecontroller.dart';
import 'package:super_admin/core/class/handlingdataview.dart';
import 'package:super_admin/core/functions/customappbar.dart';
import 'package:super_admin/view/Homepage/widgets/bottomnavbar.dart';

class Settings extends StatelessWidget {
  const Settings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.find();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Title
            Text(
              'Account',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Change Password'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Handle Change Password action
              },
            ),
            ListTile(
              title: Text('Delete Account'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Handle Delete Account action
              },
            ),
            Divider(),

            // Section Title
            SizedBox(height: 20),
            Text(
              'Preferences',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SwitchListTile(
              title: Text('Enable Notifications'),
              value: controller.notificationsEnabled,
              onChanged: (bool value) {
                // setState(() {
                //   _notificationsEnabled = value;
                // });
              },
            ),
            ListTile(
              title: Text('Select Language'),
              trailing: DropdownButton<String>(
                value: controller.selectedLanguage,
                icon: Icon(Icons.arrow_drop_down),
                onChanged: (String? newValue) {
                  // setState(() {
                  //   _selectedLanguage = newValue!;
                  // });
                },
                items: controller.languages
                    .map<DropdownMenuItem<String>>((String language) {
                  return DropdownMenuItem<String>(
                    value: language,
                    child: Text(language),
                  );
                }).toList(),
              ),
            ),
            Divider(),

            // Section Title
            SizedBox(height: 20),
            Text(
              'Audio Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Volume Level'),
                Text('${(controller.volumeLevel * 100).round()}%'),
              ],
            ),
            Slider(
              value: controller.volumeLevel,
              onChanged: (double value) {
                // setState(() {
                //   _volumeLevel = value;
                // });
              },
              min: 0,
              max: 1,
              divisions: 10,
              label: '${(controller.volumeLevel * 100).round()}%',
            ),
            Divider(),

            // Section Title
            SizedBox(height: 20),
            Text(
              'About',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('App Version'),
              subtitle: Text('1.0.0'),
            ),
            ListTile(
              title: Text('Privacy Policy'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Handle Privacy Policy action
              },
            ),
          ],
        ),
      ),
    );
  }
}
