part of 'color_bloc.dart';

class ColorState extends Equatable {
  final Color color;
  final bool isCheck;

  const ColorState({required this.color, required this.isCheck});

  factory ColorState.initial() => const ColorState(
      color: Colors.green,
      isCheck: false
  );

  @override
  List<Object> get props => [color, isCheck];

  @override
  bool get stringify => true;

  ColorState copyWith ({
    Color? color,
    bool? isCheck,
  }) {
    return ColorState(
        color: color ?? this.color,
        isCheck: isCheck ?? this.isCheck,
    );
  }
}

