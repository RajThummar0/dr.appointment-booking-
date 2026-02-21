import 'package:flutter/material.dart';
import 'package:flutter_application_1/Scrreens/LoginPage.dart';
import 'package:flutter_application_1/Scrreens/chat_page.dart';
import 'package:flutter_application_1/Scrreens/date_page.dart';
import 'package:flutter_application_1/Scrreens/home_page.dart';
import 'package:flutter_application_1/Scrreens/immunology_doctors_page.dart';
import 'package:flutter_application_1/Scrreens/profile_page.dart';

class PathologyDoctorsPage extends StatelessWidget {
  final List<Doctor> doctors = [
    Doctor(
      
      name: "Dr. Ananya Patel",
      specialty: "Pathologist",
      address: "1234 Health Street, Ahmedabad, Gujarat",
      rating: 4.0,
      reviews: [
        "Dr. Ananya is very knowledgeable and attentive. Highly recommend!",
      ],
    ),
    Doctor(
      name: "Dr. Rohan Mehta",
      specialty: "Clinical Pathologist",
      address: "5678 Wellness Road, Surat, Gujarat",
      rating: 4.8,
      reviews: [
        "The best experience I've had with a doctor.",
      ],
    ),
    Doctor(
      name: "Dr. Neha Joshi",
      specialty: "Cytopathologist",
      address: "9101 Cure Lane, Vadodara, Gujarat",
      rating: 4.7,
      reviews: [
        "She took the time to answer all my questions.",
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Immunology Doctors'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return DoctorCard(
            doctor: doctors[index],
            onTap: () {
              
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorDetailPage(doctor: doctors[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


class Doctor {
  final String name;
  final String specialty;
  final String address;
  final double rating;
  final List<String> reviews;

  Doctor({
    required this.name,
    required this.specialty,
    required this.address,
    required this.rating,
    required this.reviews,
  });
}


class DoctorCard extends StatefulWidget {
  final Doctor doctor;
  final VoidCallback onTap;

  DoctorCard({required this.doctor, required this.onTap});

  @override
  _DoctorCardState createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() {
          _isHovered = true;
        }),
        onExit: (_) => setState(() {
          _isHovered = false;
        }),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 15,
                      offset: Offset(0, 0),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.doctor.name,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                Text(
                  widget.doctor.specialty,
                  style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                ),
                SizedBox(height: 8.0),
                Text(
                  "Address: ${widget.doctor.address}",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Text(
                      "Rating: ${widget.doctor.rating} ⭐",
                      style: TextStyle(fontSize: 14, color: Colors.orange),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.star, color: Colors.orange),
                  ],
                ),
                SizedBox(height: 8.0),
                Text("Reviews:", style: TextStyle(fontWeight: FontWeight.bold)),
                ...widget.doctor.reviews.map((review) => Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        "• $review",
                        style: TextStyle(color: Colors.black87),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DoctorDetailPage extends StatelessWidget {
  final Doctor doctor;

  DoctorDetailPage({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(doctor.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctor.name,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              doctor.specialty,
              style: TextStyle(fontSize: 20, color: Colors.blueGrey),
            ),
            SizedBox(height: 16.0),
            Text("Address: ${doctor.address}"),
            SizedBox(height: 8.0),
            Text("Rating: ${doctor.rating} ⭐"),
            SizedBox(height: 16.0),
            Text("Reviews:", style: TextStyle(fontWeight: FontWeight.bold)),
            ...doctor.reviews.map((review) => Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text("• $review"),
            )),
          ],
        ),
      ),
    );
  }
}
