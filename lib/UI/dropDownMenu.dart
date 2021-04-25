import 'package:cropapp/UI/DataEntry.dart';
import 'package:cropapp/Utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class ExampleItem {
  static const Self = ExampleItem._('Self');
  static const Father = ExampleItem._('Father');
  static const Mother = ExampleItem._('Mother');
  static const Son = ExampleItem._('Son');
  static const Daughter = ExampleItem._('Daughter');
  static const Wife = ExampleItem._('Wife');
  static const Brother = ExampleItem._('Brother');
  static const Sister = ExampleItem._('Sister');
  static const FatherIL = ExampleItem._('Father-in-Law');
  static const MotherIL = ExampleItem._('Mother-in-Law');
  static const BrotherIL = ExampleItem._('Brother-in-Law');
  static const SisterIL = ExampleItem._('Sister-in-Law');
  static const Nephew = ExampleItem._('Nephew');
  static const Niece = ExampleItem._('Niece');

  static const values = [
    Self,
    Father,
    Mother,
    Son,
    Daughter,
    Wife,
    Brother,
    Sister,
    FatherIL,
    MotherIL,
    BrotherIL,
    SisterIL,
    Nephew,
    Niece
  ];

  const ExampleItem._(this.text);

  final String text;
}

class ExampleScreen extends StatefulWidget {
  @override
  _ExampleScreenState createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  var _current;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<ExampleItem>(
      initialValue: _current,
      onSelected: (value) {
        setState(() => _current = value);
        if (Details.isNotEmpty) {
          Details.removeAt(0);
        }
        Details.insert(0, _current.text);
      },
      onCanceled: () {
        _current = null;
      },
      itemBuilder: (BuildContext context) {
        return List<PopupMenuEntry<ExampleItem>>.generate(
            ExampleItem.values.length * 2 - 1, (int index) {
          if (index.isEven) {
            final item = ExampleItem.values[index ~/ 2];
            return DropdownMenuItem<ExampleItem>(value: item, text: item.text);
          } else {
            return DropdownDivider();
          }
        });
      },
      child: _t1(),
    );
  }

  Widget _t1() {
    if (_current == null) {
      return Text(
        'Relation',
        style: TextStyle(
            fontSize: 16, fontFamily: 'Product_Sans_Bold', color: hintText),
      );
    } else {
      return Text(
        _current.text,
        style: TextStyle(
            fontSize: 15, fontFamily: 'Product_Sans_Bold', color: text),
      );
    }
  }
}

class DropdownMenuItem<T> extends PopupMenuEntry<T> {
  const DropdownMenuItem({
    Key key,
    this.value,
    @required this.text,
  })  : assert(text != null),
        super(key: key);

  final T value;

  final String text;

  @override
  _DropdownMenuItemState<T> createState() => _DropdownMenuItemState<T>();

  @override
  double get height => 32.0;

  @override
  bool represents(T value) => this.value == value;
}

class _DropdownMenuItemState<T> extends State<DropdownMenuItem<T>> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pop<T>(widget.value),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          //drop down items
          widget.text,
          style: TextStyle(
            fontFamily: 'Product_Sans_Bold',
            fontSize: 15.0,
            color: text,
          ),
        ),
      ),
    );
  }
}

class DropdownDivider<T> extends PopupMenuEntry<T> {
  @override
  _DropdownDividerState<T> createState() => _DropdownDividerState<T>();

  @override
  double get height => 1.0;

  @override
  bool represents(T value) => false;
}

class _DropdownDividerState<T> extends State<DropdownDivider<T>> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0),
    );
  }
}

class DropdownMenu<T> extends StatefulWidget {
  const DropdownMenu({
    Key key,
    @required this.itemBuilder,
    this.initialValue,
    this.onSelected,
    this.onCanceled,
    @required this.child,
  }) : super(key: key);

  final PopupMenuItemBuilder<T> itemBuilder;
  final T initialValue;
  final PopupMenuItemSelected<T> onSelected;
  final PopupMenuCanceled onCanceled;
  final Widget child;

  @override
  _DropdownMenuState<T> createState() => _DropdownMenuState<T>();
}

class _DropdownMenuState<T> extends State<DropdownMenu<T>>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _rotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
            decoration: BoxDecoration(
                color: textBoxBack,
                border: Border.all(color: text, width: 2),
                borderRadius: BorderRadius.circular(15)),
            padding: const EdgeInsets.only(left: 20, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.child,
                IconButton(
                    padding: EdgeInsets.only(left: 150),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 40,
                    ),
                    onPressed: _showPopup)
              ],
            ));
      },
    );
  }

  void _showPopup() {
    final RenderBox button = context.findRenderObject();
    final RenderBox overlay = Overlay.of(context).context.findRenderObject();
    final Rect position = Rect.fromPoints(
      button.localToGlobal(Offset.zero, ancestor: overlay),
      button.localToGlobal(button.size.bottomRight(Offset.zero),
          ancestor: overlay),
    );
    final route = _PopupMenuRoute<T>(
      initialValue: widget.initialValue,
      items: widget.itemBuilder(context),
      position: position,
    );

    Future.delayed(const Duration(milliseconds: 150), () {
      return Navigator.of(context, rootNavigator: true)
          .push<T>(route)
          .then((T result) {
        if (!mounted) {
          return;
        }
        if (result == null) {
          widget.onCanceled?.call();
        } else {
          widget.onSelected?.call(result);
        }
      });
    });
  }
}

class _PopupMenuRoute<T> extends PopupRoute<T> {
  _PopupMenuRoute({
    this.initialValue,
    @required this.items,
    @required this.position,
    this.shadow = const BoxShadow(),
  });

  final List<PopupMenuEntry<T>> items;
  final T initialValue;
  final Rect position;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  final BoxShadow shadow;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondary, Widget child) {
    final opacity =
        CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn);
    final top = Tween<double>(begin: position.top, end: position.bottom)
        .animate(opacity);
    return FadeTransition(
      opacity: opacity,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            children: <Widget>[
              Positioned(
                top: top.value,
                left: position.left,
                width: position.width,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: position.width,
                    maxWidth: position.width,
                    minHeight: 0.0,
                    maxHeight: constraints.maxHeight - position.bottom,
                  ),
                  child: child,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return _PopupPanel(
      items: items,
      padding: EdgeInsets.only(top: 4.0),
      shadow: shadow,
    );
  }
}

/// Popup panel of list items
class _PopupPanel<T> extends StatelessWidget {
  const _PopupPanel({
    Key key,
    @required this.items,
    this.pointerPosition = 0.9,
    this.pointerSize = 8.0,
    this.padding,
    this.shadow = const BoxShadow(),
  })  : assert(padding != null),
        super(key: key);

  final List<PopupMenuEntry<T>> items;
  final double pointerPosition;
  final double pointerSize;
  final EdgeInsets padding;
  final BoxShadow shadow;

  @override
  Widget build(BuildContext context) {
    //drop down menu box
    final border = _PopupPanelBorder(
      side: BorderSide(color: text, width: 2),
      borderRadius: BorderRadius.circular(15),
      color: textBoxBack,
    );
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 80),
      child: Container(
        decoration: BoxDecoration(border: border),
        child: Material(
          type: MaterialType.transparency,
          child: ListView(
            primary: false,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: items,
          ),
        ),
      ),
    );
  }
}

/// Custom popup panel border with pointer positioned along the top edge.
class _PopupPanelBorder extends BoxBorder {
  const _PopupPanelBorder({
    this.side = BorderSide.none,
    this.borderRadius = BorderRadius.zero,
    this.pointerPosition = 0,
    this.pointerSize = 0,
    this.color,
    this.shadow,
  })  : assert(side != null),
        assert(borderRadius != null);

  /// The style of this border.
  final BorderSide side;

  @override
  BorderSide get top => side;

  @override
  BorderSide get bottom => side;

  @override
  bool get isUniform => true;

  /// The radii for each corner.
  final BorderRadiusGeometry borderRadius;

  /// The fraction across the top edge the pointer should align to.
  final double pointerPosition;

  /// The size of the pointer in logical pixels.
  final double pointerSize;

  final Color color;

  final BoxShadow shadow;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  ShapeBorder scale(double t) {
    return _PopupPanelBorder(
      side: side.scale(t),
      borderRadius: borderRadius * t,
    );
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return getOuterPath(rect.deflate(side.width), textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    final radius = borderRadius.resolve(textDirection);
    final roundedRect = radius.toRRect(rect);
    final pointerRect = roundedRect.middleRect.inflate(-pointerSize);
    final pointerPos = pointerRect.left +
        (pointerRect.width * pointerPosition.clamp(0.0, 1.0));
    return Path.combine(
      PathOperation.union,
      Path()..addRRect(roundedRect),
      Path()
        ..moveTo(pointerPos, rect.top - pointerSize)
        ..lineTo(pointerPos + pointerSize, rect.top)
        ..lineTo(pointerPos - pointerSize, rect.top)
        ..close(),
    );
  }

  @override
  void paint(Canvas canvas, Rect rect,
      {TextDirection textDirection,
      BoxShape shape = BoxShape.rectangle,
      BorderRadius borderRadius}) {
    final path = getOuterPath(rect, textDirection: textDirection);
    if (shadow != null) {
      final scale = 1.0 + shadow.spreadRadius / 100;
      final center = rect.center;
      final m = Matrix4.translationValues(center.dx, center.dy, 0.0)
        ..scale(scale, scale)
        ..translate(-center.dx, -center.dy);
      canvas.drawPath(path.transform(m.storage), shadow.toPaint());
    }
    if (color != null) {
      canvas.drawPath(path, Paint()..color = color);
    }
    if (side.style == BorderStyle.solid) {
      canvas.drawPath(path, side.toPaint());
    }
  }
}
