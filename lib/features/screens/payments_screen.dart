import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({super.key});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  final CarouselController _controller = CarouselController();
  int _currentIndex = 0;

  final TextEditingController _cardholderNameController =
      TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        title: const Text("Payments"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: 180,
                  decoration: BoxDecoration(
                      color: Color(0xff979393),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Image.asset(
                            "assets/icons/visa_icon.png",
                            height: 50,
                            width: 50,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Positioned(
                          left: 10,
                          top: 35,
                          child: Image.asset(
                            "assets/icons/card2.png",
                            height: 50,
                            width: 50,
                          ),
                        ),
                        Positioned(
                          top: 85,
                          left: 10,
                          child: Text(
                            _cardNumberController.text.isEmpty
                                ? "XXXX XXXX XXXX XXXX"
                                : _cardNumberController.text,
                            style: const TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 10,
                          right: 25,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Cardholder",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                  Text(
                                    _cardholderNameController.text
                                        .toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Exp. Date",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                  Text(
                                    _expDateController.text,
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: 180,
                  decoration: BoxDecoration(
                      color: Color(0xfff45d43),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Image.asset(
                            "assets/icons/visa_icon.png",
                            height: 50,
                            width: 50,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Positioned(
                          left: 10,
                          top: 35,
                          child: Image.asset(
                            "assets/icons/card2.png",
                            height: 50,
                            width: 50,
                          ),
                        ),
                        Positioned(
                          top: 85,
                          left: 10,
                          child: Text(
                            _cardNumberController.text.isEmpty
                                ? "XXXX XXXX XXXX XXXX"
                                : _cardNumberController.text,
                            style: const TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 10,
                          right: 25,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Cardholder",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                  Text(
                                    _cardholderNameController.text
                                        .toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Exp. Date",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                  Text(
                                    _expDateController.text,
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: 180,
                  decoration: BoxDecoration(
                      color: Color(0xff201659),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Image.asset(
                            "assets/icons/visa_icon.png",
                            height: 50,
                            width: 50,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        Positioned(
                          left: 10,
                          top: 35,
                          child: Image.asset(
                            "assets/icons/card2.png",
                            height: 50,
                            width: 50,
                          ),
                        ),
                        Positioned(
                          top: 85,
                          left: 10,
                          child: Text(
                            _cardNumberController.text.isEmpty
                                ? "XXXX XXXX XXXX XXXX"
                                : _cardNumberController.text,
                            style: const TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 10,
                          right: 25,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Cardholder",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                  Text(
                                    _cardholderNameController.text
                                        .toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Exp. Date",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                  Text(
                                    _expDateController.text,
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
                aspectRatio: 2,
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              carouselController: _controller,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 3.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? const Color(0xfff45d43)
                        : const Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),
            const Text(
              "Cardholder Name",
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff3D4958)),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: _cardholderNameController,
              decoration: InputDecoration(
                hintText: "Enter your name as written on card",
                hintStyle: const TextStyle(color: Color(0xff888d95)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xff706f6f),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xffa9a9a9),
                  ),
                ),
              ),
              onChanged: (text) {
                setState(() {});
              },
            ),
            const SizedBox(height: 15),
            const Text(
              "Card Number",
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff3D4958)),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: _cardNumberController,
              decoration: InputDecoration(
                hintText: "Enter card number",
                hintStyle: const TextStyle(color: Color(0xff888d95)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xff706f6f),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xffa9a9a9),
                  ),
                ),
              ),
              onChanged: (text) {
                setState(() {});
              },
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "CVV/CVC",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff3D4958)),
                      ),
                      const SizedBox(height: 5),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "123",
                          hintStyle: const TextStyle(color: Color(0xff888d95)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xff706f6f),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xffa9a9a9),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Exp. Date",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff3D4958)),
                      ),
                      const SizedBox(height: 5),
                      TextField(
                        controller: _expDateController,
                        decoration: InputDecoration(
                          hintText: "20/20",
                          hintStyle: const TextStyle(color: Color(0xff888d95)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xff706f6f),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xffa9a9a9),
                            ),
                          ),
                        ),
                        onChanged: (text) {
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: GestureDetector(
                onTap: () {
                  print("card was saved successfully");
                  Navigator.pop(context);
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xffF45D43),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Center(
                    child: Text(
                      "Save Card",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xffFFFFFF),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
