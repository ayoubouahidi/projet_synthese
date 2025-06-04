import 'package:flutter/material.dart';


class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Track. Optimisez. Autonomisez",
    image: "assets/icones/image1.png",
    desc: "Trackez votre énergie, optimisez votre autonomie !",
  ),
  OnboardingContents(
    title: "Vos panneaux solaires en chiffres !",
    image: "assets/icones/image2.png",
    desc:
        "Vos panneaux travaillent, mesurez leurs résultats !.",
  ),
  OnboardingContents(
    title: "Le soleil produit, votre app gère !",
    image: "assets/icones/image3.png",
    desc:
        "Du soleil à votre prise, gardez le contrôle !",
  ),
];