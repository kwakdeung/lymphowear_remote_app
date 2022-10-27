class Onboarding {
  final String image, description;
  final double marginTop;

  Onboarding({
    required this.image,
    required this.marginTop,
    required this.description,
  });
}

final List<Onboarding> onboardingData = [
  Onboarding(
    image: "assets/images/onboarding_01.png",
    marginTop: 10,
    description:
        "LymphoWear is the world-first wearable device for lymphatic drainage massage.",
  ),
  Onboarding(
    image: "assets/images/onboarding_02.png",
    marginTop: 20,
    description: "This app helps you to control your device easier.",
  ),
  Onboarding(
    image: "assets/images/onboarding_03.png",
    marginTop: 50,
    description: "Also enjoy 3 types of massage program we provide!",
  ),
];
