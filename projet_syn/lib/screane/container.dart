import 'package:flutter/material.dart';
import 'package:projet_syn/item/itemMap.dart';
import 'package:projet_syn/nav/appBar.dart';
import 'package:projet_syn/screane/homePage.dart';
import '../test/testTripe.dart';


class ContainerPage extends StatefulWidget {
  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  int _selectedIndex = 0;

  List<Trip> trips = [
    sampleTrip,
    sampleTrip,
    sampleTrip,
    sampleTrip,
    sampleTrip,
  ];

  Widget _buildContent() {
    switch (_selectedIndex) {
      case 0:
        return Homepage();
      case 1:
        return MapScreenWidget();
      case 2:
        return Center(child: Text("Settings Page"));
      default:
        return Center(child: Text("Unknown Page"));
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? Color(0xFF22C55E) // Green-500
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 24,
              color: isSelected
                  ? Colors.white
                  : Color(0xFF166534), // Green-800
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isSelected
                    ? Colors.white
                    : Color(0xFF166534),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.grey[100],
      body: _buildContent(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 247, 246, 250),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(icon: Icons.home, label: 'Home', index: 0),
                _buildNavItem(icon: Icons.menu, label: 'Menu', index: 1),
                _buildNavItem(icon: Icons.settings, label: 'Settings', index: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
