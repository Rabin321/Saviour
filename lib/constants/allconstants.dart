import 'package:flutter/material.dart';
import 'package:saviour/navbar/navbarscreens/emergency_contacts.dart';
import 'package:saviour/navbar/navbarscreens/profile_screen.dart';

import 'package:saviour/screens/home.dart';
import 'package:saviour/navbar/navbarscreens/settingsnavbar.dart';

const List<Widget> screens = [
  Home(),
  EmergencyContacts(),
  ProfileScreen(),
  SettingNavBarScreen(),
];
