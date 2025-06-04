import 'package:flutter/material.dart';
import 'package:projet_syn/item/TripItemWidget%20.dart';
import 'package:projet_syn/screane/BusinessTripHome.dart';
import '../test/testTripe.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Trip> trips = [
    sampleTrip,
    sampleTrip,
    sampleTrip,
    sampleTrip,
    sampleTrip,
  ];

  Widget _buildContent() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Explore Trips',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        ...trips.map((trip) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BusinessTripHome(),
              ),
            );
          },
          child: TripItemWidget(trip: trip),
        )).toList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }
}
