import 'package:flutter/material.dart';
import 'package:flutter_app1/components/colored_button.dart';

final Future<String> placeholderForLoading = Future.delayed(
  const Duration(seconds: 5),
  () => 'hello world',
);

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: placeholderForLoading,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return const StartWidget();
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('error'),
              );
            } else {
              return const LoadingWidget();
            }
          })),
    );
  }
}

class LogoWidget extends StatelessWidget {
  final double width;
  final double height;

  const LogoWidget(this.width, this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(width / 2),
      child: SizedBox(
        width: width,
        height: height,
        child: Image.asset('assets/logo.png'),
      ),
    );
  }
}

class StartWidget extends StatelessWidget {
  const StartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LogoWidget(128, 128),
            const SizedBox(
              height: 128,
            ),
            ColoredButton('Login', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Placeholder(),
                ),
              );
            }),
            const SizedBox(
              height: 24,
            ),
            ColoredButton(
              'Register',
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Placeholder(),
                ),
              ),
              secondary: false,
            ),
            const SizedBox(
              height: 24,
            ),
            const Text('Or'),
            ColoredButton(
              'Login with Google',
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Placeholder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LogoWidget(128, 128),
          SizedBox(
            height: 24,
          ),
          SizedBox(
            height: 32,
            width: 32,
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
