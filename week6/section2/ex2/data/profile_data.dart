import 'package:flutter/material.dart';
import '../model/profile_tile_model.dart';

ProfileData myProfile = ProfileData(
    name: "Ou Venhav",
    position: "Flutter Developer",
    avatarUrl: 'assets/w4-s2/man.jpg',
    tiles: [
      TileData(
          icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
      TileData(
          icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
      TileData(icon: Icons.email, title: "Mail", value: "ouvenhav@gmail.com"),
      TileData(
          icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
      TileData(
          icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
      TileData(icon: Icons.email, title: "Mail", value: "ouvenhav@gmail.com"),
    ]);
