import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../blocs/options/options_bloc.dart';
import '../../../blocs/options/options_state.dart';

class RiskRewardChart extends StatelessWidget {
  const RiskRewardChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OptionsBloc, OptionsState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: 300,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: true),
                  titlesData: const FlTitlesData(
                    bottomTitles: AxisTitles(
                      axisNameWidget: Text('Price of Underlying'),
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    leftTitles: AxisTitles(
                      axisNameWidget: Text('Profit / Loss'),
                      sideTitles: SideTitles(showTitles: true),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: state.xValues.asMap().entries.map((entry) {
                        return FlSpot(entry.value, state.yValues[entry.key]);
                      }).toList(),
                      isCurved: true,
                      barWidth: 2,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text('Max Profit: \$${state.maxProfit.toStringAsFixed(2)}'),
            Text('Max Loss: \$${state.maxLoss.toStringAsFixed(2)}'),
            Text('Break-Even Points: ${state.breakEvenPoints.join(', ')}'),
          ],
        );
      },
    );
  }
}
