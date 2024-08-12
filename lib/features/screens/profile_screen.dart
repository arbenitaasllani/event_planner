import 'package:event_planner/features/screens/edit_profile.dart';
import 'package:event_planner/features/screens/favorite_screen.dart';
import 'package:event_planner/features/screens/my_ticket.dart';
import 'package:event_planner/features/screens/payments_screen.dart';
import 'package:event_planner/features/screens/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        title: const Text("My Profile"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const EditProfile()));
              },
              child: const Icon(
                Icons.edit,
                size: 25,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  "assets/images/model2.png",
                  width: 120,
                  height: 120,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Arbenita Asllani",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Container(
                width: double.infinity,
                // height: double.infinity,
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                  color: const Color(0xfff4f4f4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 15.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const MyTicketScreen()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/icons/ticket_selected.png",
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                                child: Text(
                              "My Tickets",
                              style: TextStyle(
                                  fontSize: 17.0, fontWeight: FontWeight.w600),
                            )),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 22,
                              color: Color(0xffF45D43),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Divider(color: Color(0xffa9a9a9)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => FavoriteScreen()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/icons/favorite_selected.png",
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                                child: Text(
                              "Favorite Events",
                              style: TextStyle(
                                  fontSize: 17.0, fontWeight: FontWeight.w600),
                            )),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 22,
                              color: Color(0xffF45D43),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Divider(color: Color(0xffa9a9a9)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const PaymentsScreen()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/icons/wallet_icon.png",
                              width: 27,
                              height: 27,
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                                child: Text(
                              "Payments",
                              style: TextStyle(
                                  fontSize: 17.0, fontWeight: FontWeight.w600),
                            )),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 22,
                              color: Color(0xffF45D43),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Divider(color: Color(0xffa9a9a9)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => SettingsScreen()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/icons/settings.png",
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                                child: Text(
                              "Settings",
                              style: TextStyle(
                                  fontSize: 17.0, fontWeight: FontWeight.w600),
                            )),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 22,
                              color: Color(0xffF45D43),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
