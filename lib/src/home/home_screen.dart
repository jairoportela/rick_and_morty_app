import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/characters/presentation/screens/characters_screen.dart';
import 'package:rick_and_morty_app/src/core/config/routes.dart';
import 'package:rick_and_morty_app/src/core/presentation/widgets/separators.dart';
import 'package:rick_and_morty_app/src/episodes/presentation/screens/episodes_screen.dart';
import 'package:rick_and_morty_app/src/locations/presentation/screens/locations_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routePath = '/';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.colorBurn,
          ),
          child: Image.network(
            'https://wallpapers.com/images/featured/rick-and-morty-8rc57d4ds44gqzau.jpg',
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: LayoutBuilder(builder: (context, constraint) {
            return SizedBox(
              height: constraint.maxHeight / 1.75,
              width: constraint.maxWidth,
              child: Card(
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(60))),
                color: Theme.of(context).colorScheme.surface,
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(20).copyWith(top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Rick And Morty App',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const VerticalSeparator(
                        value: 30,
                      ),
                      ScreensListTile(
                        icon: Icons.person,
                        name: ScreensTitles.characters.title,
                        path: CharactersScreen.routePath,
                      ),
                      const VerticalSeparator(
                        value: 15,
                      ),
                      ScreensListTile(
                        icon: Icons.video_collection,
                        name: ScreensTitles.episodes.title,
                        path: EpisodesScreen.routePath,
                      ),
                      const VerticalSeparator(
                        value: 15,
                      ),
                      ScreensListTile(
                        icon: Icons.location_on_sharp,
                        name: ScreensTitles.locations.title,
                        path: LocationsScreen.routePath,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class ScreensListTile extends StatelessWidget {
  const ScreensListTile({
    super.key,
    required this.icon,
    required this.name,
    required this.path,
  });
  final String path;
  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(name),
      onTap: () => Navigator.of(context).pushNamed(path),
    );
  }
}
