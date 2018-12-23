import 'package:flutter/material.dart';
//import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';

//const String _kGalleryAssetsPackage = 'species_images';
const String _kGalleryAssetsPackage = 'imagenes';

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

  bool get isValid => assetName != null && speciesName != null && description?.length == 3;
}

//Deine the two tests species. Later, this will be done with data from the jsons
final List<TreeSpecies> speciesList = <TreeSpecies>[
  const TreeSpecies(
    assetName: 'images/ash_tree.jpg',
    assetPackage: _kGalleryAssetsPackage,
    speciesName: 'Ashelius Treeius',
    tipoTierra: 'negra',
    tiempoCrec: 4,
    cuidados: 'Se debe mantener lejos de los ninos',
    description: <String>['Esta es la descripcion',
    'no estoy seguro que poner aqui',
    'lo siento',
    ],
  ),
  const TreeSpecies(
    assetName: 'images/fresno.jpg',
    assetPackage: _kGalleryAssetsPackage,
    speciesName: 'Fresnous Treeius',
    tipoTierra: 'verde y humeda',
    tiempoCrec: 821,
    cuidados: 'Necesita de mucha luz ultravioleta',
    description: <String>['Estoy escuchando un vide',
    'es muy interesnate',
    'no como esta descripcion',
    ]
  ),
  const TreeSpecies(
    assetName: 'images/melon.jpg',
    assetPackage: _kGalleryAssetsPackage,
    speciesName: 'Melonius Frutus',
    tipoTierra: 'azul',
    tiempoCrec: 45,
    cuidados: 'Necesita de mucha luz gris',
    description: <String>['Esto no es una especie de arbol',
    'es una fruta solamente',
    'pero se ve muy rica',
    ]
  ),
  const TreeSpecies(
    assetName: 'images/carro.jpg',
    assetPackage: _kGalleryAssetsPackage,
    speciesName: 'Fastus Carronius',
    tipoTierra: 'indefinido',
    tiempoCrec: 9,
    cuidados: 'No necesita nada de nada',
    description: <String>['Este es un super carro',
    'lo pienso comprar',
    'manana',
    ]
  )
];

//--------------------REAL SHIT LINE----------------
class TreeSpeciesItem extends StatelessWidget {
  TreeSpeciesItem({ Key key, @required this.species, this.shape })
    : assert(species != null && species.isValid),
      super(key: key);

  static const double height = 366.0;
  final TreeSpecies species;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline.copyWith(color: Colors.white);
    final TextStyle descriptionStyle = theme.textTheme.subhead;

    return SafeArea(
      top: false,
      bottom: false,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: height,
        child: Card(
          shape: shape,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // photo and speciesName
              SizedBox(
                height: 184.0,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Image(
                        image: new AssetImage(species.assetName),
                        //package: species.assetPackage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    //Verificar lo que quiero que vaya en esta zona
                    //Algunas de las palabras no se ven bien arriba de las
                    // imagenes
                    //probablemente es mejor poner todo el texto en la zona
                    //blanca de la parte de abajo
                    Positioned(
                      bottom: 16.0,
                      left: 16.0,
                      right: 16.0,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Card(
                          child: Text(species.speciesName,
                                 style: titleStyle.copyWith(color: Colors.black),
                                 ),
                          ),
                      ),
                    ),
                  ],
                ),
              ),
              // description and share/explore buttons
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: DefaultTextStyle(
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: descriptionStyle,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // three line description
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            species.description[0],
                            style: descriptionStyle.copyWith(color: Colors.black54),
                          ),
                        ),
                        Text(species.description[1]),
                        Text(species.description[2]),
                      ],
                    ),
                  ),
                ),
              ),
              // share, explore buttons
              ButtonTheme.bar(
                child: ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FlatButton(
                      child: Text('SHARE', semanticsLabel: 'Share ${species.speciesName}'),
                      textColor: Colors.amber.shade500,
                      onPressed: () { /* do nothing */ },
                    ),
                    FlatButton(
                      child: Text('EXPLORE', semanticsLabel: 'Explore ${species.speciesName}'),
                      textColor: Colors.amber.shade500,
                      onPressed: () { /* do nothing */ },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  //static const String routeName = '/material/cards';

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ShapeBorder _shape;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Especies de arboles'),
      ),
      body: ListView(
        itemExtent: TreeSpeciesItem.height,
        padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
        children: speciesList.map<Widget>((TreeSpecies species) {
          return Container(
            margin: const EdgeInsets.only(bottom: 8.0),
            child: TreeSpeciesItem(
              species: species,
              shape: _shape,
            ),
          );
        }).toList()
      )
    );
  }
}
