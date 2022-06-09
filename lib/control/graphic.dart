

import 'package:data_analyze/data/functions.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Graphic{
  late SfCartesianChart chart;
  late TooltipBehavior _tooltipBehavior;
  late ZoomPanBehavior _zoomPanBehavior;

  Graphic(FunctionXY func){
    _tooltipBehavior = TooltipBehavior(enable: true);
    _zoomPanBehavior =  ZoomPanBehavior(
        enableSelectionZooming: true,
        enableDoubleTapZooming: true,
        enablePinching: true,
        enablePanning: true
    );
    chart = SfCartesianChart(
        // tooltipBehavior: _tooltipBehavior,
        zoomPanBehavior: _zoomPanBehavior,
        series: <ChartSeries>[
          LineSeries<Point, double>(
              enableTooltip: true,
              dataSource: func.data!,
              xValueMapper: (Point data, _) => data.x,
              yValueMapper: (Point data, _) => data.y)
        ]
    );
  }
}