import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodels/dashboard_viewmodel.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  // final channel = MethodChannel('channel');

  // void setUpMethodChannel() {
  //   channel.setMethodCallHandler((MethodCall call) async {
  //     if (call.method == 'callDartMethod') {
  //       final String message = call.arguments;
  //       final name = message.split(',').elementAt(0);
  //       final email = message.split(',').elementAt(1);
  //       final imageName = message.split(',').elementAt(2);
  //       final result = setProfileData(
  //         name: name,
  //         email: email,
  //         imageName: imageName,
  //       );
  //       return result;
  //     }
  //   });
  // }

  // void setProfileData({
  //   String? name,
  //   String? email,
  //   String? imageName,
  // }) {
  //   ref.read(dashboardViewmodel.notifier).setProfile(name, email, imageName);
  // }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(dashboardViewmodel.notifier).fetchWeatherData('Cairo');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(dashboardViewmodel.select((e) => e.isLoading));
    final data = ref.watch(dashboardViewmodel.select((e) => e.data));
    final weather = data?.data;
    final name = data?.name;
    final email = data?.email;
    final imageName = data?.imageName;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  if (weather != null)
                    Column(
                      children: [
                        Text(
                          weather.name ?? '',
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${weather.main?.temp}°C',
                          style: const TextStyle(
                              fontSize: 48, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          weather.weather?.firstOrNull?.description ?? '',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  const Divider(),
                  if (name != null)
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  if (email != null)
                    Text(
                      email,
                      style: const TextStyle(
                          fontSize: 48, fontWeight: FontWeight.w500),
                    ),
                  if (imageName != null)
                    Text(
                      imageName,
                      style: const TextStyle(fontSize: 20),
                    ),
                ],
              ),
            ),
    );
  }
}
