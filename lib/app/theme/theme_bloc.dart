import 'package:MovieDiscoveryApp/ApiServices/params.dart';
import 'package:MovieDiscoveryApp/utils/common_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Bloc class to manage theme events and states
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final sharedPref = CommonSharedPreferences(); // Instance for shared preferences

  // Constructor initializing the BLoC with initial state and event handlers
  ThemeBloc() : super(const ThemeState()) {
    on<GetCurrentThemeEvent>(_getDefaultThemeEvent);
    on<SetDarkThemeEvent>(_setDarkTheme);
    on<SetLightThemeEvent>(_setLightTheme);
    on<SetDefaultSystemThemeEvent>(_setDefaultThemeEvent);
  }

  // Event handler to set the theme to dark mode
  void _setDarkTheme(SetDarkThemeEvent event, Emitter<ThemeState> emit) {
    emit(state.copyWith(currentTheme: ThemeMode.dark, selectedTheme: 'dark'));
    CommonSharedPreferences.setPreferences(Params.CURRENT_THEME, state.selectedTheme);
  }

  // Event handler to set the theme to light mode
  void _setLightTheme(SetLightThemeEvent event, Emitter<ThemeState> emit) {
    emit(state.copyWith(currentTheme: ThemeMode.light, selectedTheme: 'light'));
    CommonSharedPreferences.setPreferences(Params.CURRENT_THEME, state.selectedTheme);
  }

  // Event handler to set the theme to the default system theme
  void _setDefaultThemeEvent(
      SetDefaultSystemThemeEvent event, Emitter<ThemeState> emit) {
    CommonSharedPreferences.setPreferences(Params.CURRENT_THEME, 'default');
    final defaultThemeMode = WidgetsBinding.instance.window.platformBrightness;
    final value = ThemeMode.values.byName(defaultThemeMode.name);
    emit(state.copyWith(currentTheme: value, selectedTheme: 'default'));
  }

  // Event handler to retrieve the current theme from shared preferences
  void _getDefaultThemeEvent(
      GetCurrentThemeEvent event, Emitter<ThemeState> emit) async {
    // Fetch the stored theme from shared preferences
    final String? theme = await CommonSharedPreferences.getPreferences(Params.CURRENT_THEME) as String?;
    if (theme == null || theme == 'default') {
      // If no theme is set, determine the default based on system settings
      final defaultThemeMode = WidgetsBinding.instance.window.platformBrightness;
      final value = ThemeMode.values.byName(defaultThemeMode.name);
      emit(state.copyWith(currentTheme: value, selectedTheme: 'default'));
    } else {
      // Emit the stored theme state
      final value = ThemeMode.values.byName(theme);
      emit(state.copyWith(currentTheme: value, selectedTheme: value.name));
    }
  }
}

// Base class for theme events
sealed class ThemeEvent  {
  const ThemeEvent();
}

// Event to get the current theme
class GetCurrentThemeEvent extends ThemeEvent {
  const GetCurrentThemeEvent();
}

// Event to set the theme to dark
class SetDarkThemeEvent extends ThemeEvent {
  const SetDarkThemeEvent();
}

// Event to set the theme to light
class SetLightThemeEvent extends ThemeEvent {
  const SetLightThemeEvent();
}

// Event to set the theme to the default system theme
class SetDefaultSystemThemeEvent extends ThemeEvent {
  const SetDefaultSystemThemeEvent();
}

// Class representing the theme state
class ThemeState  {
  final ThemeMode currentTheme; // Current theme mode (light/dark)
  final String selectedTheme; // String representing the selected theme

  // Constructor with default values
  const ThemeState({
    this.currentTheme = ThemeMode.light,
    this.selectedTheme = 'light'
  });

  // Method to create a copy of the state with optional changes
  ThemeState copyWith({ThemeMode? currentTheme, String? selectedTheme}) {
    return ThemeState(
        currentTheme: currentTheme ?? this.currentTheme,
        selectedTheme: selectedTheme ?? this.selectedTheme
    );
  }
}
