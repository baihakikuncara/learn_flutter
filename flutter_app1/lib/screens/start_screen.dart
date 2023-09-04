import 'package:flutter/material.dart';

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
              return const LoginWidget();
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
    return SizedBox(
      width: width,
      height: height,
      child: Image.asset('assets/logo.png'),
    );
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

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
            StartScreenButton('Login', () {}),
            const SizedBox(
              height: 24,
            ),
            StartScreenButton('Register', () {}),
            const SizedBox(
              height: 24,
            ),
            const Text('Or'),
            StartScreenButton('Login with Google', () {}),
          ],
        ),
      ),
    );
  }
}

class StartScreenButton extends StatelessWidget {
  static const double buttonWidth = 200;

  final String text;
  final Function() func;

  const StartScreenButton(this.text, this.func, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: func,
        child: Text(text),
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
