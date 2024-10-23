import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../app/theme/theme_bloc.dart'; // Importing theme management via BLoC
import 'drawer_item.dart'; // Importing the DrawerItem widget for individual items in the drawer

// A stateless widget representing the application drawer
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        // Building the drawer based on the current theme state
        return Drawer(
          width: MediaQuery.of(context).size.width * .6, // Set drawer width to 60% of screen width
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), // Rounded corners at the top right
              bottomRight: Radius.circular(16), // Rounded corners at the bottom right
            ),
          ),
          child: SafeArea(
            child: ListView(
              padding: EdgeInsets.zero, // No padding around the ListView
              children: <Widget>[
                const SizedBox(height: 10), // Space at the top
                Padding(
                  padding: const EdgeInsets.only(top: 6, left: 20), // Padding for the title
                  child: Text(
                    'Colour Scheme', // Title for the theme options
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).primaryColor), // Styled text
                  ),
                ),
                const SizedBox(height: 20), // Space below the title

                // Dark Mode option
                DrawerItem(
                  title: 'Dark Mode', // Display title
                  asset: const Icon(Icons.mode_night, size: 20), // Icon for dark mode
                  onTap: () {
                    // Dispatch event to set dark theme when tapped
                    context.read<ThemeBloc>().add(const SetDarkThemeEvent());
                  },
                  isSelected: state.selectedTheme == 'dark', // Highlight if selected
                ),

                // Light Mode option
                DrawerItem(
                  title: 'Light Mode', // Display title
                  asset: const Icon(Icons.light_mode, size: 20), // Icon for light mode
                  onTap: () {
                    // Dispatch event to set light theme when tapped
                    context.read<ThemeBloc>().add(const SetLightThemeEvent());
                  },
                  isSelected: state.selectedTheme == 'light', // Highlight if selected
                ),

                // Default System Theme option
                DrawerItem(
                  title: 'Default System', // Display title
                  onTap: () {
                    // Dispatch event to set default system theme when tapped
                    context.read<ThemeBloc>().add(const SetDefaultSystemThemeEvent());
                  },
                  asset: const Icon(Icons.wb_twilight, size: 20), // Icon for default theme
                  isSelected: state.selectedTheme == 'default', // Highlight if selected
                ),

                const Divider(), // Divider line at the bottom of the drawer
              ],
            ),
          ),
        );
      },
    );
  }
}
