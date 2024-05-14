import 'package:flutter/material.dart';
import 'package:{{project_name}}/core/services/shared_prefs_service.dart';
import 'package:{{project_name}}/ui/screens/home/home_screen.dart';
import 'package:{{project_name}}/utils/consts.dart';
import 'package:{{project_name}}/utils/extensions/l10n_extension.dart';
import 'package:{{project_name}}/utils/extensions/routing_extension.dart';
import 'package:{{project_name}}/utils/extensions/style_extension.dart';

/// The routing for the onboarding screen.
class OnboardingScreenRouting {
  /// The route path for the onboarding screen.
  static const String routePath = '/onboarding';

  /// Builds the route for the onboarding screen.
  static PageRoute<T> buildRoute<T>({
    RouteSettings? settings,
  }) {
    return MaterialPageRoute<void>(
      builder: (BuildContext context) => const OnboardingScreen(),
      settings: settings,
    ) as PageRoute<T>;
  }
}

/// The onboarding screen.
class OnboardingScreen extends StatefulWidget {
  /// Creates the onboarding screen.
  const OnboardingScreen({super.key});

  /// Creates the mutable state for this widget.
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: <Widget>[
          _buildPageContent(
            title: context.l10n.onboardingScreen1Title,
            body: context.l10n.onboardingScreen1Description,
          ),
          _buildPageContent(
            title: context.l10n.onboardingScreen2Title,
            body: context.l10n.onboardingScreen2Description,
          ),
          _buildPageContent(
            title: context.l10n.onboardingScreen3Title,
            body: context.l10n.onboardingScreen3Description,
          ),
        ],
      ),
      bottomSheet: _currentPage != 2
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    _pageController.jumpToPage(2);
                  },
                  child: Text(context.l10n.skipButton),
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 2.5),
                TextButton(
                  onPressed: () {
                    _pageController.animateToPage(
                      _currentPage + 1,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Text(context.l10n.nextButton),
                ),
              ],
            )
          : InkWell(
              onTap: _finishOnboarding,
              child: Container(
                height: 60,
                color: context.colorScheme.primaryContainer,
                alignment: Alignment.center,
                child: Text(
                  context.l10n.getStartedButton,
                  style: TextStyle(
                    color: context.colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildPageContent({required String title, required String body}) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: context.textTheme.displayMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(body, style: context.textTheme.headlineMedium),
        ],
      ),
    );
  }

  Future<void> _finishOnboarding() async {
    await sharedPrefs.prefs.setBool(SharedPrefsConsts.showOnboarding, false);
    if (!mounted) return;
    await context.pushReplacement(HomeScreenRouting.routePath);
  }
}
