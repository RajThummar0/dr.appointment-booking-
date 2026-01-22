import 'package:flutter/material.dart';
import 'package:flutter_application_1/Scrreens/chat_page.dart';
import 'package:flutter_application_1/Scrreens/date_page.dart';
import 'package:flutter_application_1/Scrreens/immunology_doctors_page.dart';
import 'package:flutter_application_1/Scrreens/pathology_doctors_page.dart';
import 'package:flutter_application_1/Scrreens/profile_page.dart';
import 'package:flutter_application_1/Scrreens/Loginpage.dart';


class HomePage extends StatelessWidget {
  final String userName;

  
  HomePage({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🩺 ~ 𝔹𝕖 ℍ𝕒𝕡𝕡𝕪 ... '),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Upcoming Schedule Section
              Text(
                'Upcoming Schedule',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              UpcomingScheduleCard(
                doctorName: 'Dr. Rashmika Sharma',
                specialty: 'Psychiatrist',
                dateTime: 'Jan 28, 12:25 am',
              ),
              UpcomingScheduleCard(
                doctorName: 'Dr. Mayank Prakash',
                specialty: 'Gynecologist',
                dateTime: 'Jan 18, 12:00 pm',
              ),
              SizedBox(height: 20),
              // Categories Section
              Text(
                'Categories',
                //this is the categories
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              CategoriesGrid(),
              SizedBox(height: 20),
              // Top Doctors Section
              Text(
                'Top Doctors',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TopDoctorCard(
                doctorName: 'Dr. Rahul Sharma',
                specialty: 'Dental',
                ratings: 585,
              ),
              TopDoctorCard(
                doctorName: 'Dr. Monika Goyal',
                specialty: 'Surgeon',
                ratings: 698,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Date',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              // Already on Home, no action needed
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(),
                ),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DatePage(),
                ),
              );
              break;
          }
        },
      ),
    );
  }
}

class CategoriesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PathologyDoctorsPage(),
              ),
            );
          },
          child: CategoryCard(title: 'Pathology', icon: Icons.biotech),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImmunologyDoctorsPage(),
              ),
            );
          },
          child: CategoryCard(title: 'Immunology', icon: Icons.science),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GynaecologyDoctorsPage(),
              ),
            );
          },
          child: CategoryCard(title: 'Gynaecology', icon: Icons.pregnant_woman),
        ),
        CategoryCard(title: 'Cardiology', icon: Icons.favorite),
        CategoryCard(title: 'Neurology', icon: Icons.psychology),
        CategoryCard(title: 'Quick Test', icon: Icons.health_and_safety),
      ],
    );
  }
}

class GynaecologyDoctorsPage extends StatelessWidget {
  final List<Doctor> doctors = [
    Doctor(
      name: "Dr. Priya Sharma",
      specialty: "Gynaecologist",
      address: "1234 Care Avenue, Ahmedabad, Gujarat",
      rating: 4.6,
      reviews: [
        "Dr. Priya is very caring and professional.",
      ],
    ),
    Doctor(
      name: "Dr. Sanya Patel",
      specialty: "Obstetrician",
      address: "5678 Health Lane, Surat, Gujarat",
      rating: 4.9,
      reviews: [
        "Excellent service, highly recommend!",
      ],
    ),
    Doctor(
      name: "Dr. Neelam Joshi",
      specialty: "Reproductive Endocrinologist",
      address: "9101 Wellness Street, Vadodara, Gujarat",
      rating: 4.7,
      reviews: [
        "Took time to explain everything thoroughly.",
      ],
    ),
  ];

GynaecologyDoctorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gynaecology Doctors'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return DoctorCard(doctor: doctors[index]);
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

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  DoctorCard({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctor.name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.pinkAccent),
            ),
            Text(
              doctor.specialty,
              style: TextStyle(fontSize: 16, color: Colors.blueGrey),
            ),
            SizedBox(height: 8.0),
            Text(
              "Address: ${doctor.address}",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Text(
                  "Rating: ${doctor.rating} ⭐",
                  style: TextStyle(fontSize: 14, color: Colors.orange),
                ),
                SizedBox(width: 10),
                Icon(Icons.star, color: Colors.orange),
              ],
            ),
            SizedBox(height: 8.0),
            Text("Reviews:", style: TextStyle(fontWeight: FontWeight.bold)),
            ...doctor.reviews.map((review) => Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text("• $review", style: TextStyle(color: Colors.black87)),
            )),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;

  CategoryCard({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[50],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class UpcomingScheduleCard extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String dateTime;

  UpcomingScheduleCard({
    required this.doctorName,
    required this.specialty,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(doctorName),
        subtitle: Text('$specialty\n$dateTime'),
      ),
    );
  }
}

class TopDoctorCard extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final int ratings;

  TopDoctorCard({
    required this.doctorName,
    required this.specialty,
    required this.ratings,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(doctorName),
        subtitle: Text(specialty),
        trailing: Text('$ratings ratings'),
      ),
    );
  }
}


