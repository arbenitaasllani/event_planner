import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<String> favoriteEvents = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    final List<String> favorites = [];
    for (String key in keys) {
      if (prefs.getBool(key) ?? false) {
        favorites.add(key);
      }
    }
    setState(() {
      favoriteEvents = favorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        title: const Text("Favorites"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: favoriteEvents.isEmpty
            ? const Center(child: Text("No favorite events yet."))
            : ListView.builder(
          itemCount: favoriteEvents.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(favoriteEvents[index]),
            );
          },
        ),
      ),
    );
  }
}
