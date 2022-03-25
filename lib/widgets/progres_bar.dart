/* import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  const StepProgressView(
  final _stepProgressViewHeight = 150.0;
  late Size _safeAreaSize;
  final Color _activeColor = const Color(0xff652D69);
  final Color _inactiveColor = const Color(0xfac3f3e9);
  int _curPage = 1;
  )
  StepProgressView _getStepProgress() {
    return StepProgressView(
      _curPage,
      _stepProgressViewHeight,
      _activeColor,
      _inactiveColor,
      decoration: const BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.only(
        top: 48.0,
        left: 24.0,
        right: 24.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
class StepProgressView extends StatelessWidget {
  const StepProgressView(
      List<String> stepsText,
      int curStep,
      double height,
      double width,
      double dotRadius,
      Color activeColor,
      Color inactiveColor,
      TextStyle headerStyle,
      TextStyle stepsStyle, {
        Key key,
        this.decoration,
        this.padding,
        this.lineHeight = 2.0,
      })  : _stepsText = stepsText,
        _curStep = curStep,
        _height = height,
        _width = width,
        _dotRadius = dotRadius,
        _activeColor = activeColor,
        _inactiveColor = inactiveColor,
        _headerStyle = headerStyle,
        _stepStyle = stepsStyle,
        assert(curStep > 0 == true && curStep <= stepsText.length),
        assert(width > 0),
        assert(height >= 2 * dotRadius),
        assert(width >= dotRadius * 2 * stepsText.length),
        super(key: key);
*/
