import 'package:flutter/material.dart';
import 'package:projet_syn/item/itemMap.dart'; // تأكد أن عندك ملف MapScreenWidget معرف هنا

class BusinessTripHome extends StatefulWidget {
  @override
  _BusinessTripHomeState createState() => _BusinessTripHomeState();
}

class _BusinessTripHomeState extends State<BusinessTripHome> {
  String _currentCity = "Casablanca"; // المدينة الحالية (تقدر تغيرها برمجياً)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('Business Trip Home'),
        backgroundColor: Colors.green[400],
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // بطاقة رحلة العمل مع صورة وخلفية متدرجة
                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1449824913935-59a10b8d2000?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.3),
                        ],
                      ),
                    ),
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Business Trip',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(0, 1),
                            blurRadius: 2,
                            color: Colors.black45,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30),

                // زر TRAJET ROAD
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.green[400],
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.3),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        print('Road trip button tapped');
                      },
                      child: Center(
                        child: Text(
                          'TRAJET ROAD',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30),

                // قسم النقل مع زر "see All"
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transport',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('See all tapped');
                      },
                      child: Text(
                        'see All',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[500],
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // أيقونات النقل (Indriver, Uber, Other)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTransportIcon(
                      'Indriver',
                      Colors.yellow[600]!,
                      'iD',
                      () => _showTransportDialog('Indriver'),
                    ),
                    _buildTransportIcon(
                      'Uber',
                      Colors.black,
                      'Uber',
                      () => _showTransportDialog('Uber'),
                    ),
                    _buildTransportIcon(
                      'Other',
                      Colors.grey[400]!,
                      '✈',
                      () => _showTransportDialog('Other Transport'),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, -2),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.green[400],
                        size: 24,
                      ),
                      SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Current Location',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              _currentCity,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: MapScreenWidget(),
                    ),
                  ),
                ],
              ),
            ),
              ],
            ),
          ),
      ],
      ),
    );
  }

  // عرض حوار عند الضغط على أيقونة النقل
  void _showTransportDialog(String transportType) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(transportType),
          content: Text('You selected $transportType transport option.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            )
          ],
        );
      },
    );
  }

  Widget _buildTransportIcon(
      String label, Color bgColor, String fallbackText, VoidCallback onTap) {
    Color textColor;
    if (bgColor == Colors.black) {
      textColor = Colors.white;
    } else if (bgColor == Colors.yellow[600]) {
      textColor = Colors.black;
    } else {
      textColor = Colors.white;
    }

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                fallbackText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
