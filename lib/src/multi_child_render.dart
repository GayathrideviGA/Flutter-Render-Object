import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyMultiChildWidget extends MultiChildRenderObjectWidget {
  const MyMultiChildWidget({Key? key, required List<Widget> children})
      : super(key: key, children: children);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _MyRenderObject();
  }
}

class _MyRenderObject extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, MultiChildLayoutParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, MultiChildLayoutParentData>,
        DebugOverflowIndicatorMixin {
  _MyRenderObject() : super();

  @override
  void performLayout() {
    // Get the constraints for the layout
    final BoxConstraints constraints = this.constraints;

    // Layout the children
    RenderBox? child = firstChild;
    while (child != null) {
      child.layout(constraints, parentUsesSize: true);
      final MultiChildLayoutParentData childParentData =
          child.parentData! as MultiChildLayoutParentData;
      childParentData.offset = Offset.zero;
      child = childParentData.nextSibling;
    }

    // Set the size of this render object
    size = constraints.constrain(
        Size(double.infinity, computeMaxIntrinsicHeight(constraints.maxWidth)));

    // Update the overflow indicator if needed
    markNeedsPaint();
  }

  double computeMaxIntrinsicHeight(double width) {
    double maxHeight = 0.0;
    RenderBox? child = firstChild;
    while (child != null) {
      final double intrinsicHeight =
          child.getMaxIntrinsicHeight(double.infinity);
      maxHeight = math.max(maxHeight, intrinsicHeight);
      child = childAfter(child);
    }
    return maxHeight;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }
}
