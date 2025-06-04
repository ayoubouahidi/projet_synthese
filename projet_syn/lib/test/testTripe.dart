
// Trip model class
class Trip {
  final String title;
  final String imageUrl;
  final List<String> locations;
  final String priceRange;
  final bool isCompleted;

  Trip({
    required this.title,
    required this.imageUrl,
    required this.locations,
    required this.priceRange,
    this.isCompleted = false,
  });
}

final sampleTrip = Trip(
      title: 'Business Trip',
      imageUrl: 'https://www.bing.com/th/id/OIP.rzXWdlAM1awmHCmvTcLr3wHaFj?w=143&h=106&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2', // Replace with actual image URL
      locations: ['san', 'haderabad', 'delhi', 'mumbai', 'pune'],
      priceRange: '200\$ < @ > 300\$',
      isCompleted: true,
    );