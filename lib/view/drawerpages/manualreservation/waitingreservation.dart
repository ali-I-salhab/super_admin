import 'package:flutter/material.dart';
import 'package:super_admin/view/drawerpages/addacount/widgets/customAppbar.dart';
import 'package:super_admin/view/drawerpages/manualreservation/widgets/customreservationcard.dart';

class WaitingReservation extends StatelessWidget {
  const WaitingReservation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          CustomizableAppBar(title: 'Waiting reservations', isactioned: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomReservationCard(
              step: 3,
              ontap: () {},
            ),
            CustomReservationCard(
              step: 2,
              ontap: () {},
            ),
            CustomReservationCard(
              step: 2,
              ontap: () {},
            ),
            CustomReservationCard(
              step: 2,
              ontap: () {},
            )
          ],
        ),
      ),
    );
  }
}
