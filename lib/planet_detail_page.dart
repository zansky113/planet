import 'dart:ui';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class PlanetDetailPage extends StatelessWidget {
  final Map<String, dynamic> planet;
  const PlanetDetailPage({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        width: width,
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.03,
              ),
              Text(
                planet['planetName'].toUpperCase(),
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                planet['nickName'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: height * 0.25,
                    width: width,
                    child: Image.asset(
                      "assets/images/${planet['imagePath']}",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    top: height * 0.23,
                    width: width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        color: Colors.transparent,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                width: height * 0.08,
                                height: height * 0.08,
                                color: Colors.black.withOpacity(0.1),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.black.withOpacity(0.1),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.thermostat,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    planet['temperature'].toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Text(
                planet['distanceToEarth'].toString().toUpperCase(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.withOpacity(0.8),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.vpn_lock_outlined,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                  SizedBox(width: width * 0.02),
                  DottedLine(
                    lineLength: width * 0.6,
                    direction: Axis.horizontal,
                    dashColor: Colors.grey.withOpacity(0.8),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              PlanetDetailItem(
                icon: Icons.speed,
                title: "Average Orbital Speed",
                values: planet["averageOrbitalSpeed"].toString(),
              ),
              PlanetDetailItem(
                icon: Icons.satellite_alt,
                title: "Satellites",
                values: planet["satellitesSent"].toString(),
              ),
              PlanetDetailItem(
                icon: Icons.architecture_sharp,
                title: "Surface Area",
                values: planet["surfaceArea"].toString(),
              ),
              PlanetDetailItem(
                icon: Icons.rotate_right_outlined,
                title: "Rotation Period",
                values: "${planet["rotationPeriod"]}d",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlanetDetailItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String values;
  const PlanetDetailItem({
    super.key,
    required this.icon,
    required this.title,
    required this.values,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(vertical: height * 0.02),
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      width: width,
      height: height * 0.08,
      decoration: BoxDecoration(
        color: Colors.blue[900]!.withOpacity(0.2),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: height * 0.04,
          ),
          SizedBox(
            width: width * 0.04,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              Text(
                values,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
