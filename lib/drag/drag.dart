import 'package:flutter/material.dart';

void main() {
  runApp(DragAndDropApp());
}

class DragAndDropApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DragAndDropScreen(),
    );
  }
}
 
class DragAndDropScreen extends StatefulWidget {
  @override
  _DragAndDropScreenState createState() => _DragAndDropScreenState();
}

class _DragAndDropScreenState extends State<DragAndDropScreen> {
  GlobalKey<_DraggableBoxState> draggableKey = GlobalKey();
  Offset position = Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drag and Drop Example"),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            DraggableBox(
              key: draggableKey,
              offset: position,
            ),
            Positioned(
              left: position.dx + 100,
              top: position.dy + 100,
              child: DragTarget(
                onAccept: (Offset newPosition) {
                  setState(() {
                    position = newPosition;
                  });
                },
                builder: (BuildContext context, List<dynamic> acceptedData, rejectedData) {
                  return Container(
                    width: 150,
                    height: 150,
                    color: Colors.blue,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DraggableBox extends StatefulWidget {
  final Offset offset;

  DraggableBox({Key key, this.offset}) : super(key: key);

  @override
  _DraggableBoxState createState() => _DraggableBoxState();
}

class _DraggableBoxState extends State<DraggableBox> {
  Offset position = Offset(0, 0);

  @override
  void initState() {
    super.initState();
    position = widget.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Draggable(
        data: position,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
        feedback: Container(
          width: 100,
          height: 100,
          color: Colors.red.withOpacity(0.7),
        ),
        onDraggableCanceled: (Velocity velocity, Offset offset) {
          setState(() {
            position = offset;
          });
        },
      ),
    );
  }
}
