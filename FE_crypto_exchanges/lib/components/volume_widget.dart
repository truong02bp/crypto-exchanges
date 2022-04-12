import 'package:crypto_exchanges/model/candle.dart';
import 'package:crypto_exchanges/theme/color_palette.dart';
import 'package:flutter/material.dart';

/// This widget extends [LeafRenderObjectWidget]
/// And uses CandleStickRenderObject for painting the chart.
class VolumeWidget extends LeafRenderObjectWidget {
  final List<Candle> candles;
  final int index;
  final double barWidth;
  final double high;
  VolumeWidget({
    required this.candles,
    required this.index,
    required this.barWidth,
    required this.high,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return VolumeRenderObject(
      candles,
      index,
      barWidth,
      high,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderObject renderObject) {
    VolumeRenderObject candlestickRenderObject =
    renderObject as VolumeRenderObject;
    candlestickRenderObject._candles = candles;
    candlestickRenderObject.index = index;
    candlestickRenderObject.barWidth = barWidth;
    candlestickRenderObject.high = high;
    candlestickRenderObject.markNeedsPaint();
    super.updateRenderObject(context, renderObject);
  }
}

/// This render object is responsible for
/// drawing the configured chart on the canvas.
class VolumeRenderObject extends RenderBox {
  late List<Candle> _candles;
  late int _index;
  late double _barWidth;
  late double _high;

  VolumeRenderObject(
      List<Candle> candles,
      int index,
      double barWidth,
      double high,
      ) {
    _candles = candles;
    _index = index;
    _barWidth = barWidth;
    _high = high;
  }

  set index(int index) {
    if (_index == index) return;
    _index = index;
  }

  set barWidth(double barWidth) {
    if (_barWidth == barWidth) return;
    _barWidth = barWidth;
  }

  set high(double high) {
    _high = high;
  }

  /// set size as large as possible
  @override
  void performLayout() {
    size = Size(constraints.maxWidth, constraints.maxHeight);
  }

  /// draws a single candle
  void paintBar(PaintingContext context, Offset offset, int index,
      Candle candle, double range) {
    Color color = candle.open < candle.close
        ? ColorPalette.darkGreen
        : ColorPalette.darkRed;

    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    var path = Path()
      ..addRect(Rect.fromPoints(
          Offset(size.width + offset.dx - (index * _barWidth + 0.5),
              offset.dy + (_high - candle.volume) / range),
          Offset(size.width + offset.dx - ((index + 1) * _barWidth - 0.5),
              offset.dy + size.height)));
    context.canvas.drawPath(path, paint);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    double range = (_high) / size.height;
    for (int i = 0; (i + 1) * _barWidth < size.width; i++) {
      if (i + _index >= _candles.length || i + _index < 0) continue;
      var candle = _candles[i + _index];
      paintBar(context, offset, i, candle, range);
    }
    context.canvas.save();
    context.canvas.restore();
  }
}
