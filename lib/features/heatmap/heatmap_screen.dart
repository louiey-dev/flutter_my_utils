import 'package:flutter/material.dart';
import 'package:flutter_my_utils/features/heatmap/fl_heatmap.dart';

class HeatmapScreen extends StatelessWidget {
  const HeatmapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        FlHeatMapScreen(),
      ],
    );
  }
}
