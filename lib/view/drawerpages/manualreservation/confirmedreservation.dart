import 'package:flutter/material.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customAppbar.dart';
import 'package:super_admin/view/drawerpages/manualreservation/widgets/customreservationcard.dart';

class ConfirmededReservation extends StatelessWidget {
  const ConfirmededReservation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomizableAppBar(
          title: 'Confirmed  reservations', isactioned: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomReservationCard(
              step: 2,
              ontap: () {},
            ),
            CustomReservationCard(
              step: 3,
              ontap: () {},
            ),
            CustomReservationCard(
              step: 4,
              ontap: () {},
            ),
            CustomReservationCard(
              step: 5,
              ontap: () {},
            ),
            CustomReservationCard(
              step: 6,
              ontap: () {},
            ),
            CustomReservationCard(
              step: 7,
              ontap: () {},
            ),
            CustomReservationCard(
              step: 8,
              ontap: () {},
            )
          ],
        ),
      ),
    );
  }
}
