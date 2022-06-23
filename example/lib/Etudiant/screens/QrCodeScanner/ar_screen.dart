// import 'package:arcore_flutter_plugin_example/screens/qr_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
// import 'package:vector_math/vector_math_64.dart' as vector;
// class SecondPage extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//       home:  Column(
//         children: [
//           Text("data"),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => new MaterialApp(
//                   home: Text("cnjlqbvjqjvd"),
//                 ),
//               ));
//             },
//             child: const Text('qrView'),
//           )
//         ],
//       ),
//     );
//   }
//
// }
// class ARCode extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return AugmentedPage();
//   }
//
// }
// class AugmentedPage extends StatefulWidget {
//   @override
//   _AugmentedPageState createState() => _AugmentedPageState();
// }
//
// class _AugmentedPageState extends State<AugmentedPage> {
//   ArCoreController arCoreController;
//   Map<int, ArCoreAugmentedImage> augmentedImagesMap = Map();
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('AugmentedPage'),
//         ),
//         body: ArCoreView(
//           onArCoreViewCreated: _onArCoreViewCreated,
//           type: ArCoreViewType.AUGMENTEDIMAGES,
//         ),
//       ),
//     );
//   }
//
//   void _onArCoreViewCreated(ArCoreController controller) async {
//     arCoreController = controller;
//     // arCoreController.onTrackingImage = _handleOnTrackingImage;
//     // loadSingleImage();
//     //OR
//     // loadImagesDatabase();
//     _addSphere();
//   }
//
//   // loadSingleImage() async {
//   //   final ByteData bytes =
//   //   await rootBundle.load('assets/earth_augmented_image.jpg');
//   //   arCoreController.loadSingleAugmentedImage(
//   //       bytes: bytes.buffer.asUint8List());
//   // }
//
//   // loadImagesDatabase() async {
//   //   final ByteData bytes = await rootBundle.load('assets/myimages.imgdb');
//   //   arCoreController.loadAugmentedImagesDatabase(
//   //       bytes: bytes.buffer.asUint8List());
//   // }
//   //
//   // _handleOnTrackingImage(ArCoreAugmentedImage augmentedImage) {
//   //   if (!augmentedImagesMap.containsKey(augmentedImage.index)) {
//   //     augmentedImagesMap[augmentedImage.index] = augmentedImage;
//   //     _addSphere(augmentedImage);
//   //   }
//   // }
//
//   Future _addSphere() async {
//     final ByteData textureBytes = await rootBundle.load('assets/earth.jpg');
//
//     final material = ArCoreMaterial(
//       color: Color.fromARGB(120, 66, 134, 244),
//       textureBytes: textureBytes.buffer.asUint8List(),
//     );
//     final sphere = ArCoreSphere(
//       materials: [material],
//       radius: 0.1
//       // radius: augmentedImage.extentX / 2,
//     );
//     final node = ArCoreNode(
//       // objectUrl: 'https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Duck/glTF-Binary/Duck.glb',
//       shape: sphere,
//       position: vector.Vector3(0,0,-1.5),
//
//     );
//     arCoreController.addArCoreNode(node);
//   }
//
//   @override
//   void dispose() {
//     arCoreController.dispose();
//     super.dispose();
//   }
// }

// import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import 'package:arcore_flutter_plugin_example/Etudiant/models/utils.dart';
import 'package:flutter/rendering.dart';
import 'package:vector_math/vector_math_64.dart' as vector;


import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';

import 'new_scan_new_qr.dart';

// [UnivIt : Errouk Ismail]
class ArModelScreen extends StatefulWidget {
  final String modelUrl;

  const ArModelScreen({Key key, this.modelUrl}) : super(key: key);


  @override
  _ArModelScreenState createState() => _ArModelScreenState();
}

class _ArModelScreenState extends State<ArModelScreen> {
  ArCoreController arCoreController;

  String objectSelected;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(

          title: const Text('Custom Object on plane detected'),
        ),
        body: Column(
          children: [
            Container(
              height: 700,
              child: ArCoreView(
                onArCoreViewCreated: _onArCoreViewCreated,
                enableTapRecognizer: true,
              ),
            ),
            // FlatButton(onPressed: () { Navigator.pop(context); },
            FlatButton(onPressed: () {
              arCoreController.dispose();
              Navigator.push(context, new MaterialPageRoute(builder: (context)=> new NewScanNewQr())); },
                child: Text("Go Back"))
          ],
        )

        ,
        // Column(
        //   children: [
        //     Container(
        //       height: 550,
        //
        //     ),
        //     Builder(builder: (context)=>TextButton(
        //       onPressed: () {
        //         // arCoreController.
        //         // Navigator.of(cont  ext).push(MaterialPageRoute(
        //         //   builder: (context) => QrScan(),
        //         // ));
        //         Navigator.push(
        //             context, MaterialPageRoute(builder: (context) => QrScan()));
        //       },
        //       child: Text("Prend une autre QR"),
        //     ))
        //   ],
        // ),
      ),

      // ElevatedButton(
      //   onPressed: () {
      //     Navigator.of(context).push(MaterialPageRoute(
      //       builder: (context) => const QRViewExample(),
      //     ));
      //   },
      //   child: const Text('qrView'),
      // ),
    );
  }

// [UnivIt : Errouk Ismail]
  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onNodeTap = (name) => onTapHandler(name);
    arCoreController.onPlaneTap = _handleOnPlaneTap;
  }

  void _addToucano(ArCoreHitTestResult plane) {

    final toucanNode = ArCoreReferenceNode(
        scale: vector.Vector3.all(0.00005),
        name: "Toucano",
        objectUrl:

        Utils.RootUrl+widget.modelUrl,

        position: plane.pose.translation,

        rotation: plane.pose.rotation);

    arCoreController.addArCoreNodeWithAnchor(toucanNode);
  }

// [UnivIt : Errouk Ismail]
  void _handleOnPlaneTap(List<ArCoreHitTestResult> hits) {
    final hit = hits.first;
    _addToucano(hit);
  }

  void onTapHandler(String name) {
    print("Flutter: onNodeTap");
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Row(
          children: <Widget>[
            Text('Remove $name?'),
            IconButton(
                icon: Icon(
                  Icons.delete,
                ),
                onPressed: () {
                  arCoreController.removeNode(nodeName: name);
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}
