import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// A custom widget custom render object that draws a blue rectangle on a canvas, with its height determined by the value passed from CustomRect.

class CustomRect extends LeafRenderObjectWidget {
  final double value; // declaring a final variable of double type named value

  // constructor for the CustomRect widget that takes in a key and a required value
  const CustomRect({Key? key, required this.value}) : super(key: key);

  // override method for creating a render object with the given BuildContext
  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomRenderObject(context)..value = value;
  }

  // override method for updating an existing render object with a new context and renderObject
  @override
  void updateRenderObject(
      BuildContext context, CustomRenderObject renderObject) {
    renderObject.value = value;
  }
}

class CustomRenderObject extends RenderBox {
  BuildContext context;
  double _value = 0.0;
  CustomRenderObject(this.context);

  // setter method for setting the value of _value
  set value(double newValue) {
    if (_value == newValue) return;
    _value = newValue;
    markNeedsLayout();
  }

  // override method for performing layout of the widget
  @override
  void performLayout() {
    size = Size(
        100,
        _value *
            100); // set the size of the widget based on the _value variable
  }

  // override method for painting the widget on the screen
  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.drawRect(
        offset & size,
        Paint()
          ..color = Colors
              .blue); // draw a rectangle on the canvas using the offset and size properties of the widget
  }

  // override method for describing the semantics of the widget
  @override
  void describeSemanticsConfiguration(SemanticsConfiguration config) {
    super.describeSemanticsConfiguration(config);
    config.label = 'Custom RenderObject with value $_value';
    config.textDirection = Directionality.of(context);
  }
}
