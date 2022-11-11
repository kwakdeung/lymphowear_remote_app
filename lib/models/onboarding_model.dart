class Onboarding {
  final String bgImage, image, description, title;
  final double marginTop;

  Onboarding({
    required this.bgImage,
    required this.image,
    required this.marginTop,
    required this.title,
    required this.description,
  });
}

final List<Onboarding> onboardingData = [
  Onboarding(
    bgImage: '',
    image: "assets/images/onboarding_01.png",
    marginTop: 20,
    title: "Custom Mode",
    description:
        "LymphoWear is the world-first wearable device for lymphatic drainage massage.",
  ),
  Onboarding(
    bgImage: 'assets/images/background_onboarding_02_image.png',
    image: "assets/images/onboarding_02_image.png",
    marginTop: 20,
    title: "Custom Mode",
    description: "This app helps you to control your device easier.",
  ),
  Onboarding(
    bgImage: 'assets/images/background_onboarding_03_image.png',
    image: "assets/images/onboarding_03_image.png",
    marginTop: 50,
    title: "3 Massage Modes",
    description: "Also enjoy 3 types of massage program we provide!",
  ),
];
