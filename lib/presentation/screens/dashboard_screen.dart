import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodels/dashboard_viewmodel.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(dashboardViewmodel.notifier).fetchWeatherData();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(dashboardViewmodel.select((e) => e.isLoading));
    final weather = ref.watch(dashboardViewmodel.select((e) => e.data));
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
                ],
              ),
            ),
    );
  }
}
