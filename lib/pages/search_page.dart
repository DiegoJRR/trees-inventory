import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';

const String _kGalleryAssetsPackage = 'flutter_gallery_assets';

//Creation of the tree-species class
class TreeSpecies {
  const TreeSpecies({
    //Asset name and package are to recover the images
    this.assetName,
    this.assetPackage,
    //Features or variables for each tree species
    this.speciesName,
    this.tipoTierra,
    this.tiempoCrec,
    this.cuidados,
    this.description,
  });

  final String assetName;
  final String assetPackage;
  final String speciesName;
  final String tipoTierra;
  final int tiempoCrec;
  final String cuidados;
  final List<String> description;

  bool get isValid => assetName != null && speciesName != null && description?.length != null;
}


class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Grid List';

    var especies = ['Palo muy muy muy alto, este texto es muy largo, a ver que hace con esto', 'Bugambilia', 'Roble', 'Palo alto', 'Bugambilia', 'Roble', 'Palo alto', 'Bugambilia', 'Roble', 'Palo alto', 'Bugambilia', 'Roble', 'Palo alto', 'Bugambilia', 'Roble'];
    for(var i=0; i < especies.length; i++) {print(especies[i]);}

    //List of created widgets using the species names
    List<Text> createChildrenItems() {
      List<Text> childrenItems = List<Text>();

      for (String name in especies) {
        childrenItems.add(Text('$name', style: new TextStyle(fontSize: 25.0), textAlign: TextAlign.center));
      }
      return childrenItems;
    }

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this would produce 2 rows.
          //padding: const EdgeInsets.all(20.0),
          crossAxisCount: 3,
          addRepaintBoundaries: true,
          // Generate 100 Widgets that display their index in the List
          children: createChildrenItems(),
        ),
      ),
    );
  }
}
