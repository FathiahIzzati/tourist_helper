import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ViewPlace extends StatefulWidget {
  @override
  _ViewPlaceState createState() => _ViewPlaceState();
}

class _ViewPlaceState extends State<ViewPlace> {
  List<dynamic> places = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchPlaces();
  }

  Future<void> _fetchPlaces() async {
    final url = Uri.https(
      'touristhelper-ce278-default-rtdb.asia-southeast1.firebasedatabase.app',
      'places.json',
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          places = data.entries
              .map((entry) => {...entry.value, 'id': entry.key})
              .toList();
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage =
              'Failed to load places. Status code: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        errorMessage = 'Error fetching places: $error';
        isLoading = false;
      });
    }
  }

  Future<void> _deletePlace(String placeId) async {
    final url = Uri.https(
      'touristhelper-ce278-default-rtdb.asia-southeast1.firebasedatabase.app',
      'places/$placeId.json',
    );

    try {
      final response = await http.delete(url);
      if (response.statusCode == 200) {
        _fetchPlaces();
      } else {
        setState(() {
          errorMessage =
              'Failed to delete place. Status code: ${response.statusCode}';
        });
      }
    } catch (error) {
      setState(() {
        errorMessage = 'Error deleting place: $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Places'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : ListView.builder(
                  itemCount: places.length,
                  itemBuilder: (BuildContext context, int index) {
                    final place = places[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ListTile(
                          title: Text(place['placeName'] ?? 'Unnamed Place'),
                          subtitle: Text(place['description'] ??
                              'No description available'),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _deletePlace(place['id']);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
