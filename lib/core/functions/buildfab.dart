import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:super_admin/core/constants/colors.dart';

class ExpandableFab1 extends StatefulWidget {
  const ExpandableFab1(
      {Key? key, required this.children, required this.distance})
      : super(key: key);

  final List<Widget> children;
  final double distance;

  @override
  _ExpandableFabState createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab1>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _expandAnimation;
  bool _open = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        value: _open ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 250),
        vsync: this);

    _expandAnimation = CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
        reverseCurve: Curves.easeOutQuad);
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _tapToClose(),
          ..._buildExpandableFabButton(),
          _tapToOpen(),
        ],
      ),
    );
  }

  Widget _tapToClose() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: AppColors.white),
          color: Colors.white,
          borderRadius: BorderRadius.circular(180)),
      height: 55,
      width: 55,
      child: Center(
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: InkWell(
            onTap: _toggle,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.close,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _tapToOpen() {
    return AnimatedContainer(
      decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.white),
          borderRadius: BorderRadius.circular(180)),
      duration: const Duration(milliseconds: 250),
      transformAlignment: Alignment.center,
      transform:
          Matrix4.diagonal3Values(_open ? 0.7 : 1.0, _open ? 0.7 : 1.0, 1.0),
      curve: Curves.easeOut,
      child: AnimatedOpacity(
        opacity: _open ? 0.0 : 1.0,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
        child: FloatingActionButton(
          onPressed: _toggle,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  List<Widget> _buildExpandableFabButton() {
    final List<Widget> children = <Widget>[];
    final count = widget.children.length;
    final step = 180.0 / 2;

    for (var i = 0, angleInDegrees = 0.0;
        i < count;
        i++, angleInDegrees += step) {
      children.add(_ExpandableFab(
          // 00
          directionDegrees: angleInDegrees,
          maxDistance: 50,
          progress: _expandAnimation,
          child: widget.children[i]));
    }

    return children;
  }
}

class _ExpandableFab extends StatelessWidget {
  const _ExpandableFab(
      {Key? key,
      required this.directionDegrees,
      required this.maxDistance,
      required this.progress,
      required this.child})
      : super(key: key);

  final double directionDegrees;
  final double maxDistance;
  final Animation<double>? progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      // moves
      animation: progress!,
      builder: (context, child) {
        final offset = Offset.fromDirection(
            directionDegrees * (math.pi / 10), progress!.value * maxDistance);

        return Positioned(
          right: offset.dx + 150,
          bottom: offset.dy + 80,
          child: Transform.rotate(
            angle: (1.0 - progress!.value) * math.pi / 2,
            child: child,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress!,
        child: child,
      ),
    );
  }
}
