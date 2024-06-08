import 'package:flutter/material.dart';
import 'package:newlivestock/models/cow.dart';
import 'package:newlivestock/pages/about_page.dart';
import 'package:newlivestock/pages/birth_weight.dart';
import 'package:newlivestock/pages/deworming_page.dart';
import 'package:newlivestock/pages/homepage.dart';
import 'package:newlivestock/pages/insemination.dart';
import 'package:newlivestock/pages/pdf.dart';
import 'package:newlivestock/pages/pregnancy.dart';
import 'package:newlivestock/pages/puberty.dart';
import 'package:newlivestock/pages/treatment.dart';
import 'package:newlivestock/pages/vaccination.dart';

class IndividualCowDetail extends StatelessWidget {
  final String cowId;

  const IndividualCowDetail({
    Key? key,
    required this.cowId,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(193, 215, 172, 1),
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            //ABOUT
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: SingleChildScrollView(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutPage(
                          cowId: cowId,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 80,
                    width: 351,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Color.fromRGBO(255, 255, 255, 0.7),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AboutPage(
                              cowId: cowId,
                            ),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "About",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 23,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(77, 119, 34, 1),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //DE-WORMING

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: SingleChildScrollView(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DewormingPage(
                          cowId: cowId,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 80,
                    width: 351,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Color.fromRGBO(255, 255, 255, 0.7),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DewormingPage(
                              cowId: cowId,
                            ),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Center the child horizontally
                        children: [
                          Text(
                            "De-Worming",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 23,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(77, 119, 34, 1),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //PREGNANCY

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: SingleChildScrollView(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PregnancyPage(
                          cowId: cowId,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 80,
                    width: 351,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Color.fromRGBO(255, 255, 255, 0.7),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PregnancyPage(
                              cowId: cowId,
                            ),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Center the child horizontally
                        children: [
                          Text(
                            "Pregnancy",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 23,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(77, 119, 34, 1),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //DATE OF PUBERTY

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: SingleChildScrollView(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Puberty(
                          cowId: cowId,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 80,
                    width: 351,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Color.fromRGBO(255, 255, 255, 0.7),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Puberty(
                              cowId: cowId,
                            ),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Center the child horizontally
                        children: [
                          Text(
                            "Date of Puberty",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 23,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(77, 119, 34, 1),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //INSEMINATION

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: SingleChildScrollView(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Insemination(
                          cowId: cowId,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 80,
                    width: 351,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Color.fromRGBO(255, 255, 255, 0.7),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Insemination(
                              cowId: cowId,
                            ),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Center the child horizontally
                        children: [
                          Text(
                            "Insemination",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 23,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(77, 119, 34, 1),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //VACCINATION

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: SingleChildScrollView(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Vaccination(
                          cowId: cowId,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 80,
                    width: 351,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Color.fromRGBO(255, 255, 255, 0.7),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Vaccination(
                              cowId: cowId,
                            ),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Center the child horizontally
                        children: [
                          Text(
                            "Vaccination",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 23,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(77, 119, 34, 1),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //TREATMENT

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: SingleChildScrollView(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Treatment(
                                cowId: cowId,
                              )),
                    );
                  },
                  child: Container(
                    height: 80,
                    width: 351,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Color.fromRGBO(255, 255, 255, 0.7),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // Assuming you are navigating from another StatefulWidget
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Treatment(
                                    cowId: cowId,
                                  )),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Center the child horizontally
                        children: [
                          Text(
                            "Treatment Record",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 23,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(77, 119, 34, 1),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //BIRTH WEIGHT

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: SingleChildScrollView(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BirthWeight(
                          cowId: cowId,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 80,
                    width: 351,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Color.fromRGBO(255, 255, 255, 0.7),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // Assuming you are navigating from another StatefulWidget
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BirthWeight(
                              cowId: cowId,
                            ),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Center the child horizontally
                        children: [
                          Text(
                            "Weight Record",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 23,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(77, 119, 34, 1),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //GENERATE PDF

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: SingleChildScrollView(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExportPDFPage(
                          cowId: cowId,
                          // Pass the dewormingDates list
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 80,
                    width: 351,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Color.fromRGBO(255, 255, 255, 0.7),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // Assuming you are navigating from another StatefulWidget
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ExportPDFPage(cowId: cowId)),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Center the child horizontally
                        children: [
                          Text(
                            "PDF",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 23,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(77, 119, 34, 1),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(157, 208, 104, 1),
        shadowColor: const Color.fromRGBO(128, 45, 83, 1),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: const Color.fromRGBO(77, 119, 34, 1),
          iconSize: 37,
        ),
        centerTitle: true,
        title: Text(
          cowId,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: MediaQuery.of(context).size.width * 0.07,
            fontWeight: FontWeight.bold,
            color: const Color.fromRGBO(77, 119, 34, 1),
          ),
        ),
      ),
    );
  }
}
