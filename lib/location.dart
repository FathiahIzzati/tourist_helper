import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Location extends StatelessWidget {
  final List<Map<String, dynamic>> featuredPlaces = [
    {
      'title': 'Masjid Sendayan',
      'image': 'images/location1.jpeg',
      'description':
          'Sri Sendayan Mosque is a mosque located in Bandar Sri Sendayan , Negeri Sembilan . This mosque is one of the most beautiful mosques in Malaysia and always receives visits from outside visitors and tourists. ',
    },
    {
      'title': 'Twin Tower Malaysia',
      'image': 'images/location2.jpg',
      'description':
          'Known as the KLCC Twin Towers or simply the Twin Towers, are a pair of 88-story skyscrapers located in Kuala Lumpur, Malaysia. ',
    },
    {
      'title': 'Taming Sari',
      'image': 'images/location3.jpg',
      'description':
          'Taming Sari Tower is a 24-story, 110-meter-tall gyro tower in Malacca City, Malacca, Malaysia. It is the first and tallest gyro tower in Malaysia.',
    },
    {
      'title': 'Laman Mahkota Istana Bukit Serene',
      'image': 'images/location4.jpg',
      'description':
          'Mercu tanda Mahkota Istana Johor yang tersergam indah di pintu gerbang kediaman rasmi DYMM Sultan Johor',
    },
    {
      'title': 'Teluk Cempedak',
      'image': 'images/location5.jpg',
      'description':
          'Known as Palm Beach is a beach in Kuantan, Pahang, Malaysia.The white sandy beach and casuarinas and pine trees line the coast, with some rocky promontories facing the South China Sea.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            CarouselSlider.builder(
              itemCount: featuredPlaces.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  height: 500.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    image: DecorationImage(
                      image: AssetImage(featuredPlaces[index]['image']),
                      fit: BoxFit.cover, // Setting the image to fit the screen
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.black54.withOpacity(0.6),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(16.0),
                            bottomRight: Radius.circular(16.0),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              featuredPlaces[index]['title'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              featuredPlaces[index]['description'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                height: 300.0,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
