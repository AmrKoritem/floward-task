import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodels/dashboard_viewmodel.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final channel = const MethodChannel('channelll');

  void setUpMethodChannel() {
    channel.setMethodCallHandler((MethodCall call) async {
      if (call.method == 'callDartMethod') {
        final String message = call.arguments;
        final name = message.split(',').elementAt(0);
        final email = message.split(',').elementAt(1);
        final imageName = message.split(',').elementAt(2);
        final result = setProfileData(
          name: name,
          email: email,
          imageName: imageName,
        );
        return result;
      }
    });
  }

  void setProfileData({
    String? name,
    String? email,
    String? imageName,
  }) {
    ref.read(dashboardViewmodel.notifier).setProfile(name, email, imageName);
  }

  @override
  Widget build(BuildContext context) {
    const String viewType = 'ProfileScreen';
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{
      'name': 'Amr Koritem',
      'email': 'amr.koritem92@gmail.com',
      'imageName': 'img'
    };

    return UiKitView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: creationParams,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}
