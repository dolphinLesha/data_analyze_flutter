import 'dart:math';

class Point {
  late double x;
  late double y;

  Point() {
    x = 0;
    y = 0;
  }

  Point.xy(this.x, this.y);
}

abstract class FunctionXY {
  List<Point>? data;

  FunctionXY();

  FunctionXY.data(this.data);

  FunctionXY build(Map<String, dynamic> map);
}

class TrendDefaultValues {
  final int n = 1000;
  final double a = 1;
  final double b = 1;

  Map<String, dynamic> get dictValues => {'n': n, 'a': a, 'b': b};

}

class ExponentDefaultValues {
  final int n = 1000;
  final double a = 1;
  final double b = 1;

  Map<String, dynamic> get dictValues => {'n': n, 'a': a, 'b': b};
}

class RandomDefaultValues {
  final int n = 1000;
  final double minP = -1;
  final double maxP = 1;

  Map<String, dynamic> get dictValues => {'n': n, 'minP': minP, 'maxP': maxP};
}

class RandomOwnDefaultValues {
  final int n = 1000;
  final double minP = -1;
  final double maxP = 1;

  Map<String, dynamic> get dictValues => {'n': n, 'minP': minP, 'maxP': maxP};
}

class HarmonicDefaultValues {
  final int n = 1000;
  final double dt = 0.001;
  final int a1 = 10;
  final int f1 = 3;

  Map<String, dynamic> get dictValues => {'n': n, 'dt': dt,
    'a1': a1, 'f1': f1};
}

class PolyHarmonicDefaultValues {
  final int n = 1000;
  final double dt = 0.001;
  final int a1 = 10;
  final int f1 = 3;
  final int a2 = 100;
  final int f2 = 37;
  final int a3 = 15;
  final int f3 = 173;

  Map<String, dynamic> get dictValues => {'n': n, 'dt': dt,
    'a1': a1, 'f1': f1, 'a2': a2, 'f2': f2, 'a3': a3, 'f3': f3};
}


class FunctionDefaultValues {
  late List<dynamic> defaults;

  late Map<String, int> defaultsMap;

  FunctionDefaultValues(){
    defaults = [TrendDefaultValues(), ExponentDefaultValues(),
      RandomDefaultValues(), RandomOwnDefaultValues(),
    HarmonicDefaultValues(), PolyHarmonicDefaultValues()];
    defaultsMap = {};
  }
}


class Functions {

  late List<dynamic> functions;

  Functions(){
    functions = [TrendFunction(), ExponentFunction(),
      RandomFunction(), RandomOwnFunction(),
    HarmonicFunction(), PolyHarmonicFunction()];
  }
}


class TrendFunction extends FunctionXY {
  @override
  TrendFunction build(Map<String, dynamic> map) {
    data = [];
    for (int i = 0; i < map['n']; i++) {
      Point temp = Point.xy(i.toDouble(), (i * map['a'] + map['b']).toDouble());
      data!.add(temp);
    }
    return TrendFunction.data(data!);
  }

  TrendFunction();

  TrendFunction.data(List<Point> data) : super.data(data);
}

class ExponentFunction extends FunctionXY {
  @override
  ExponentFunction build(Map<String, dynamic> map) {
    data = [];
    for (int i = 0; i < map['n']; i++) {
      Point temp = Point.xy(i.toDouble(), (exp(-map['a'] * i) * map['b']).toDouble());
      data!.add(temp);
    }
    return ExponentFunction.data(data!);
  }

  ExponentFunction();

  ExponentFunction.data(List<Point> data) : super.data(data);
}

class RandomFunction extends FunctionXY {
  @override
  RandomFunction build(Map<String, dynamic> map) {
    var rnd = Random();
    data = [];
    print("here r");
    for (int i = 0; i < map['n']; i++) {
      Point temp = Point.xy(i.toDouble(), (rnd.nextDouble() * (map['maxP'] - map['minP']) + map['minP']).toDouble());
      data!.add(temp);
    }
    return RandomFunction.data(data!);
  }

  RandomFunction();

  RandomFunction.data(List<Point> data) : super.data(data);
}

class RandomOwnFunction extends FunctionXY {
  @override
  RandomOwnFunction build(Map<String, dynamic> map) {
    data = [];
    int sec = DateTime.now().millisecond;
    int proc = sec % 100000;
    for (int i = 0; i < map['n']; i++) {
      double a = pow(pow(proc + 10, 3) / 123 * i, 3).toDouble();
      proc = (a % 100000).toInt();
      Point temp = Point.xy(i.toDouble(), ((proc / 100000) * (map['maxP'] - map['minP']) + map['minP']).toDouble());
      data!.add(temp);
    }
    return RandomOwnFunction.data(data!);
  }

  RandomOwnFunction();

  RandomOwnFunction.data(List<Point> data) : super.data(data);
}

class AddFunction extends FunctionXY {
  @override
  AddFunction build(Map<String, dynamic> map) {
    data = [];
    List<FunctionXY> funcs = map['funcs'];
    int maxIndex = 0;
    int maxI = funcs[0].data!.length;

    for (int i = 0; i < funcs.length;i++){
      if (funcs[i].data!.length > maxI){
        maxI = funcs[i].data!.length;
        maxIndex = i;
      }
    }

    List<Point> data1 = funcs[maxIndex].data!;

    for (int i = 0; i < data1.length; i++) {
      for (int e = 0; e < funcs.length; e++) {
        if (e == maxIndex){
          continue;
        }
        if (funcs[e].data!.length > i){
          data1[i].y += funcs[e].data![i].y;
        }
      }
      data!.add(Point.xy(i.toDouble(), data1[i].y));
    }
    return AddFunction.data(data!);
  }

  AddFunction();

  AddFunction.data(List<Point> data) : super.data(data);
}

class MultiplyFunction extends FunctionXY {
  @override
  MultiplyFunction build(Map<String, dynamic> map) {
    data = [];
    List<FunctionXY> funcs = map['funcs'];
    int maxIndex = 0;
    int maxI = funcs[0].data!.length;

    for (int i = 0; i < funcs.length;i++){
      if (funcs[i].data!.length > maxI){
        maxI = funcs[i].data!.length;
        maxIndex = i;
      }
    }

    List<Point> data1 = funcs[maxIndex].data!;

    for (int i = 0; i < data1.length; i++) {
      for (int e = 0; e < funcs.length; e++) {
        if (e == maxIndex){
          continue;
        }
        if (funcs[e].data!.length > i){
          data1[i].y *= funcs[e].data![i].y;
        }
      }
      data!.add(Point.xy(i.toDouble(), data1[i].y));
    }
    return MultiplyFunction.data(data!);
  }

  MultiplyFunction();

  MultiplyFunction.data(List<Point> data) : super.data(data);
}

class HarmonicFunction extends FunctionXY {
  @override
  HarmonicFunction build(Map<String, dynamic> map) {
    data = [];
    int n = map['n'];
    int a1 = map['a1'];
    int f1 = map['f1'];
    double dt = map['dt'];
    for (int i = 0; i < map['n']; i++) {
      Point temp = Point.xy(i.toDouble() * dt, a1 * sin(2*pi*f1*i*dt));
      data!.add(temp);
    }
    return HarmonicFunction.data(data!);
  }

  HarmonicFunction();

  HarmonicFunction.data(List<Point> data) : super.data(data);
}

class PolyHarmonicFunction extends FunctionXY {
  @override
  PolyHarmonicFunction build(Map<String, dynamic> map) {
    data = [];
    int n = map['n'];
    var a1 = map['a1'];
    var f1 = map['f1'];
    var dt = map['dt'];
    var a2 = map['a2'];
    var f2 = map['f2'];
    var a3 = map['a3'];
    var f3 = map['f3'];
    for (int i = 0; i < map['n']; i++) {
      double temp1 = a1 * sin(2*pi*f1*i*dt);
      double temp2 = a2 * sin(2*pi*f2*i*dt);
      double temp3 = a3 * sin(2*pi*f3*i*dt);
      Point temp = Point.xy(i.toDouble() * dt, temp1+temp2+temp3);
      data!.add(temp);
    }
    return PolyHarmonicFunction.data(data!);
  }

  PolyHarmonicFunction();

  PolyHarmonicFunction.data(List<Point> data) : super.data(data);
}

