import 'package:flutter/material.dart';

class AddTripScreen extends StatefulWidget {
  const AddTripScreen({Key? key}) : super(key: key);

  @override
  State<AddTripScreen> createState() => _AddTripScreenState();
}

class _AddTripScreenState extends State<AddTripScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _durationController = TextEditingController();
  final _maxParticipantsController = TextEditingController();
  
  String? _selectedCity;
  String? _selectedCategory;
  
  final List<String> _cities = [
    'Casablanca', 'Rabat', 'Marrakech', 'Fès', 'Tanger', 
    'Agadir', 'Meknès', 'Oujda', 'Kenitra', 'Tétouan'
  ];
  
  final List<String> _categories = [
    'Adventure', 'Cultural', 'Beach', 'Mountain', 'Desert', 
    'City Tour', 'Nature', 'Historical', 'Food & Wine', 'Relaxation'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Add New Trip',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade400, Colors.blue.shade600],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.add_location_alt,
                      color: Colors.white,
                      size: 40,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Create Your Trip',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Share your amazing journey',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),

              // Trip Title
              _buildInputField(
                controller: _titleController,
                label: 'Trip Title',
                hint: 'Enter an attractive title',
                icon: Icons.title,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Description
              _buildInputField(
                controller: _descriptionController,
                label: 'Description',
                hint: 'Describe your trip experience...',
                icon: Icons.description,
                maxLines: 4,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Price per person
              _buildInputField(
                controller: _priceController,
                label: 'Price per Person (MAD)',
                hint: '0.00',
                icon: Icons.attach_money,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a price';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Duration
              _buildInputField(
                controller: _durationController,
                label: 'Duration (days)',
                hint: 'Number of days',
                icon: Icons.calendar_today,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter duration';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // City Dropdown
              _buildDropdownField(
                label: 'Destination City',
                value: _selectedCity,
                items: _cities,
                icon: Icons.location_city,
                onChanged: (value) {
                  setState(() {
                    _selectedCity = value;
                  });
                },
              ),

              const SizedBox(height: 20),

              // Category Dropdown
              _buildDropdownField(
                label: 'Trip Category',
                value: _selectedCategory,
                items: _categories,
                icon: Icons.category,
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),

              const SizedBox(height: 20),

              // Max Participants
              _buildInputField(
                controller: _maxParticipantsController,
                label: 'Maximum Participants',
                hint: 'Number of people',
                icon: Icons.group,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter max participants';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Image Upload Section
              _buildImageUploadSection(),

              const SizedBox(height: 40),

              // Submit Button
              Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade400, Colors.blue.shade600],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      spreadRadius: 0,
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: _submitTrip,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_circle_outline, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'Create Trip',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(icon, color: Colors.blue.shade400),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<String> items,
    required IconData icon,
    required void Function(String?) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.blue.shade400),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
        validator: (value) {
          if (value == null) {
            return 'Please select $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildImageUploadSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(Icons.image, color: Colors.blue.shade400),
                const SizedBox(width: 12),
                const Text(
                  'Trip Images',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 180,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.grey[300]!,
                style: BorderStyle.solid,
                width: 2,
              ),
            ),
            child: InkWell(
              onTap: _pickImage,
              borderRadius: BorderRadius.circular(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_photo_alternate,
                    size: 48,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tap to add images',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Add multiple photos of your trip',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _pickImage() {
    // Implement image picker functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Image picker functionality to be implemented'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _submitTrip() {
    if (_formKey.currentState?.validate() ?? false) {
      // Implement trip creation logic
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Trip created successfully! 🎉'),
          backgroundColor: Colors.green,
        ),
      );
      
      // Navigate back or to success page
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _durationController.dispose();
    _maxParticipantsController.dispose();
    super.dispose();
  }
}