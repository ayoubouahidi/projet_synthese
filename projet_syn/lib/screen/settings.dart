import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String selectedLanguage = 'choose a language';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.green[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.chat_bubble_outline,
            color: Colors.green[600],
            size: 20,
          ),
        ),
        title: Text(
          'Tn',
          style: TextStyle(
            color: Colors.green[600],
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            child: Stack(
              children: [
                Icon(
                  Icons.notifications_outlined,
                  color: Colors.grey[600],
                  size: 24,
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 24),
            
            // Language Section
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Ag',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                title: Text(
                  'language',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              ),
            ),
            
            SizedBox(height: 12),
            
            // Language Dropdown
            Container(
              width: 160,
              margin: EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(4),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedLanguage,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  icon: Icon(Icons.keyboard_arrow_down, color: Colors.blue),
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                  ),
                  items: [
                    DropdownMenuItem(
                      value: 'choose a language',
                      child: Text('choose a language'),
                    ),
                    DropdownMenuItem(
                      value: 'English',
                      child: Text('English'),
                    ),
                    DropdownMenuItem(
                      value: 'Spanish',
                      child: Text('Spanish'),
                    ),
                    DropdownMenuItem(
                      value: 'French',
                      child: Text('French'),
                    ),
                  ],
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedLanguage = newValue!;
                    });
                  },
                ),
              ),
            ),
            
            SizedBox(height: 24),
            
            // Menu Items
            _buildMenuItem(
              icon: Icons.visibility_outlined,
              title: 'apparence',
              onTap: () {
                // Handle appearance tap
              },
            ),
            
            SizedBox(height: 12),
            
            _buildMenuItem(
              icon: Icons.headset_mic_outlined,
              title: 'help and support',
              onTap: () {
                // Handle help and support tap
              },
            ),
            
            SizedBox(height: 12),
            
            _buildMenuItem(
              icon: Icons.info_outline,
              title: 'About',
              onTap: () {
                // Handle about tap
              },
            ),
            
            Spacer(),
            
            // Bottom Navigation
            Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.home,
                    color: Colors.black,
                    size: 28,
                  ),
                  Icon(
                    Icons.equalizer,
                    color: Colors.green[400],
                    size: 28,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.grey[700],
          size: 24,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}