import 'package:flutter/material.dart';
import 'package:newlivestock/components/colors.dart';
import 'package:newlivestock/pages/all_cows_details.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 90,
        child: BottomNavigationBar(
          backgroundColor: Colors.white.withOpacity(0),
          elevation: 0,
          type: BottomNavigationBarType.fixed, // Set the type to fixed

          onTap: (index) {
            if (index == 0) {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => Homepage()),
              );
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homepage()),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homepage()),
              );
            }
          },

          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'icons/home.png',
                width: 30,
                height: 22,
                color: const Color.fromRGBO(77, 119, 34, 1),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'icons/settings.png',
                width: 30,
                height: 22,
                color: const Color.fromRGBO(77, 119, 34, 1),
              ),
              label: 'Settings',
            ),
          ],
          selectedItemColor: const Color.fromRGBO(77, 119, 34, 1),
          unselectedItemColor: const Color.fromRGBO(77, 119, 34, 1),
        ),
      ),
      backgroundColor: AllColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 12),
            Image.asset(
              'images/app_logo.png',
              width: 60,
            ),
            Material(
              color: Colors.transparent,
              child: Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 17,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'hi',
                                  style: TextStyle(
                                    color: const Color.fromRGBO(77, 119, 34, 1),
                                    fontSize:
                                        MediaQuery.of(context).size.width / 22,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                                Text(
                                  "Have a nice day!",
                                  style: TextStyle(
                                    color: const Color.fromRGBO(77, 119, 34, 1),
                                    fontSize:
                                        MediaQuery.of(context).size.width / 18,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3.8,
                          ),
                          SizedBox(
                            height: 50,
                            child: FloatingActionButton(
                              backgroundColor:
                                  const Color.fromRGBO(255, 255, 255, 0.7),
                              elevation: 0,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Homepage()),
                                );
                              },
                              child: const Icon(
                                Icons.person,
                                size: 30,
                                color: Color.fromRGBO(77, 119, 34, 1),
                              ),
                              shape: const CircleBorder(),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                const SizedBox(height: 10),
                //CALF CONTAINER
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AllCowsDetails()),
                    );
                  },
                  child: Container(
                    height: 95,
                    width: MediaQuery.of(context).size.width * 0.89,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Color.fromRGBO(255, 255, 255, 0.7),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllCowsDetails()),
                        );
                      },
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Image.asset('images/cow.png'),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.width * 0.03),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MediaQuery.of(context).size.width < 200
                                      ? Text(
                                          'Calf',
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  25,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(
                                                  204, 26, 26, 26)),
                                        )
                                      : Text(
                                          'Calf',
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  20,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(
                                                  204, 26, 26, 26)),
                                        ),
                                  MediaQuery.of(context).size.width < 200
                                      ? Text(
                                          'calfCount',
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  22,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(
                                                  204, 26, 26, 26)),
                                        )
                                      : Text(
                                          'calfCount',
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  50,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(
                                                  204, 26, 26, 26)),
                                        )
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Transform.rotate(
                            angle: 180 * 3.14159265359 / 180,
                            child: const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                size: 30,
                                color: Color.fromRGBO(77, 119, 34, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //HEIFER CONTAINER
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Homepage()),
                    );
                  },
                  child: Container(
                    height: 95,
                    width: MediaQuery.of(context).size.width * 0.89,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Color.fromRGBO(255, 255, 255, 0.7),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Homepage()),
                        );
                      },
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Image.asset('images/cow.png'),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.width * 0.03),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MediaQuery.of(context).size.width < 200
                                      ? Text(
                                          'Calf',
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  25,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(
                                                  204, 26, 26, 26)),
                                        )
                                      : Text(
                                          'Calf',
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  20,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(
                                                  204, 26, 26, 26)),
                                        ),
                                  MediaQuery.of(context).size.width < 200
                                      ? Text(
                                          'calfCount',
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  22,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(
                                                  204, 26, 26, 26)),
                                        )
                                      : Text(
                                          'calfCount',
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  50,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(
                                                  204, 26, 26, 26)),
                                        )
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Transform.rotate(
                            angle: 180 * 3.14159265359 / 180,
                            child: const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                size: 30,
                                color: Color.fromRGBO(77, 119, 34, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //COW CONTAINER
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Homepage()),
                    );
                  },
                  child: Container(
                    height: 95,
                    width: MediaQuery.of(context).size.width * 0.89,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Color.fromRGBO(255, 255, 255, 0.7),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Homepage()),
                        );
                      },
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Image.asset('images/cow.png'),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.width * 0.03),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MediaQuery.of(context).size.width < 200
                                      ? Text(
                                          'Calf',
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  25,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(
                                                  204, 26, 26, 26)),
                                        )
                                      : Text(
                                          'Calf',
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  20,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(
                                                  204, 26, 26, 26)),
                                        ),
                                  MediaQuery.of(context).size.width < 200
                                      ? Text(
                                          'calfCount',
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  22,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(
                                                  204, 26, 26, 26)),
                                        )
                                      : Text(
                                          'calfCount',
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  50,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(
                                                  204, 26, 26, 26)),
                                        )
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Transform.rotate(
                            angle: 180 * 3.14159265359 / 180,
                            child: const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                size: 30,
                                color: Color.fromRGBO(77, 119, 34, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //OVERVIEW CONTAINER
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Homepage()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.15,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(54, 86, 23, 1),
                            Color.fromRGBO(54, 86, 23, 1),
                            Color.fromRGBO(54, 86, 23, 1),
                            Color.fromRGBO(60, 102, 19, 1),
                            Color.fromRGBO(54, 86, 23, 1),
                            Color.fromRGBO(54, 86, 23, 1),
                            Color.fromRGBO(54, 86, 23, 1),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 99, 99, 99)
                                .withOpacity(0.4),
                            blurRadius: 20,
                            spreadRadius: 2,
                            offset: const Offset(0, 10),
                          ),
                        ]),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              'Overview',
                              style: TextStyle(
                                color: Color.fromARGB(173, 255, 255, 255),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height / 30,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              children: [
                                Center(
                                    child: Column(
                                  children: [
                                    Text(
                                      "Pregnant",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              60,
                                          color: Color.fromARGB(
                                              255, 239, 239, 239),
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "pc",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              45,
                                          color: Color.fromARGB(
                                              255, 239, 239, 239),
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                )),
                                const Spacer(),
                                Center(
                                    child: Column(
                                  children: [
                                    Text(
                                      "Insemination",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              60,
                                          color: Color.fromARGB(
                                              255, 239, 239, 239),
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "ic",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              45,
                                          color: Color.fromARGB(
                                              255, 239, 239, 239),
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                )),
                                Spacer(),
                                Center(
                                    child: Column(
                                  children: [
                                    Text(
                                      "Weaning",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              60,
                                          color: Color.fromARGB(
                                              255, 239, 239, 239),
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "wc",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              45,
                                          color: Color.fromARGB(
                                              255, 239, 239, 239),
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10.0,
                              left: MediaQuery.of(context).size.width / 5.15,
                              right: MediaQuery.of(context).size.width / 5.15,
                            ),
                            child: Row(
                              children: [
                                Center(
                                    child: Column(
                                  children: [
                                    Text(
                                      "Dry State",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              60,
                                          color: Color.fromARGB(
                                              255, 239, 239, 239),
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "dc",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              45,
                                          color: Color.fromARGB(
                                              255, 239, 239, 239),
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                )),
                                Spacer(),
                                Center(
                                    child: Column(
                                  children: [
                                    Text(
                                      "Lactated",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              60,
                                          color: Color.fromARGB(
                                              255, 239, 239, 239),
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "lc",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              45,
                                          color: Color.fromARGB(
                                              255, 239, 239, 239),
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
