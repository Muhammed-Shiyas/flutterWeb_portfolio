import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/models/app_model.dart';

import 'package:portfolio/models/device_model.dart';
import 'package:portfolio/models/experience_model.dart';
import 'package:portfolio/models/skill_model.dart';
import 'package:portfolio/screen/miniProjects/Projects/parallax.dart';

import 'package:portfolio/screen/miniProjects/about/about.dart';
import 'package:portfolio/screen/miniProjects/about/contact.dart';
import 'package:portfolio/screen/miniProjects/education/education.dart';
import 'package:portfolio/screen/miniProjects/skills/skills.dart';

const double baseHeight = 790;
const double baseWidth = 1440;
List<DeviceModel> devices = [
  DeviceModel(data: Icons.apple, device: Devices.ios.iPhone13),
  DeviceModel(data: Icons.tablet, device: Devices.ios.iPad),
];

List<AppModel> apps = [
  AppModel(
      title: 'About',
      icon: Icons.person,
      color: Colors.white,
      screen: const AboutMe()),
  AppModel(
      title: 'Skills',
      color: Colors.white,
      icon: Icons.ac_unit_rounded,
      screen: const Skills()),
  AppModel(
      title: 'Projects',
      color: Colors.white,
      icon: Icons.luggage,
      screen: ProjectsParallax()),
  AppModel(
    title: 'Education',
    color: Colors.white,
    icon: Icons.school,
    screen: const Education(),
  ),
  AppModel(
      title: 'github',
      color: Colors.white,
      assetPath: "assets/appIcons/github.svg",
      link: github),
  AppModel(
      title: 'contact',
      color: Colors.white,
      icon: Icons.contact_emergency,
      screen: const Contact()),
  AppModel(
      title: 'Linkedin',
      color: Colors.white,
      link: linkedIn,
      assetPath: "assets/appIcons/linkedin.png"),
  AppModel(
    title: 'music',
    color: Colors.white,
    assetPath: "assets/appIcons/apple-music.svg",
  ),
  AppModel(
    title: 'settings',
    color: Colors.white,
    assetPath: "assets/appIcons/settings.svg",
  ),
  AppModel(
    title: 'Tv',
    color: Colors.white,
    assetPath: "assets/appIcons/apple-tv.svg",
  ),
  AppModel(
    title: 'App store',
    color: Colors.white,
    assetPath: "assets/appIcons/app-store.svg",
  ),
  AppModel(
    title: 'safari',
    color: Colors.white,
    assetPath: "assets/appIcons/safari.svg",
  ),
  AppModel(
    title: 'Clock',
    color: Colors.white,
    assetPath: "assets/appIcons/clock.svg",
  ),
  AppModel(
    title: 'Facetime',
    color: Colors.white,
    assetPath: "assets/appIcons/facetime.svg",
  ),
  AppModel(
    title: 'Message',
    color: Colors.white,
    assetPath: "assets/appIcons/ios-message.svg",
  ),
  AppModel(
    title: 'camera',
    color: Colors.white,
    assetPath: "assets/appIcons/camera.svg",
  ),
];

const String linkedIn = "https://www.linkedin.com/in/muhammed-shiyas/";
const String github = "https://github.com/Muhammed-Shiyas";

const String email = "shiyas.rpi@gmail.com";
String introduction =
    " a passionate Flutter developer. My world revolves around turning ideas into smooth, user-friendly mobile apps. I love the challenge of coding and the art of design.\n💻 With a solid grip on Flutter, I bring functionality to life. It's not just about the code for me – I also infuse a touch of style into every project.\n🌐 Always learning and adapting, I stay in sync with the latest in Flutter development. Let's create something awesome together!";

List<SkillsModel> skills = [
  SkillsModel(skillName: "Flutter", colorS: Colors.blue, iconPath: "random"),
  SkillsModel(
    skillName: "Firebase",
    colorS: Colors.yellow,
  ),
  SkillsModel(
    skillName: "Github",
    colorS: Colors.yellow,
  ),
  SkillsModel(
    skillName: "Dart",
    colorS: Colors.blue,
  ),
  SkillsModel(
    skillName: "Provider",
    colorS: Colors.orange,
  ),
  SkillsModel(
    skillName: "REST API",
    colorS: Colors.yellow,
  ),
];

List<SkillsModel> languages = [
  SkillsModel(skillName: "English", colorS: Colors.orange),
  SkillsModel(skillName: "Malayalam", colorS: Colors.black),
];

final List<JobExperience> education = [
  JobExperience(
    color: Colors.red,
    location: "Coimbatore, Tamil Nadu",
    title: ' Bachelor of Computer Applications',
    company: 'AJK College of Arts and Science',
    startDate: 'June 2020',
    endDate: 'June 2023',
    bulletPoints: [
      "",
    ],
  ),
  JobExperience(
    color: Colors.blue,
    location: "East Ottapalam",
    title: '+2',
    company: 'GHSS OTTAPALAM EAST',
    startDate: 'June 2018',
    endDate: 'June 2020',
    bulletPoints: [
      '',
    ],
  ),
];
