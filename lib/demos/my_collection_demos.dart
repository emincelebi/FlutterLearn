// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyCollectionsDemos extends StatefulWidget {
  const MyCollectionsDemos({super.key});

  @override
  State<MyCollectionsDemos> createState() => _MyCollectionsDemosState();
}

class _MyCollectionsDemosState extends State<MyCollectionsDemos> {
  late List<CollectionModel> _items;

  @override
  void initState() {
    _items = CollectionItems().items;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: PaddingUtility().paddingHorizontal,
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return _CategoryCard(model: _items[index]);
        },
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    Key? key,
    required CollectionModel model,
  })  : _model = model,
        super(key: key);

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: PaddingUtility().paddingBottom,
      child: Padding(
        padding: PaddingUtility().paddingGeneral,
        child: Column(
          children: [
            Image.asset(_model.imagePath),
            Padding(
              padding: PaddingUtility().paddingTop,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_model.name),
                  Text("${_model.price} eth"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CollectionModel {
  final String imagePath;
  final String name;
  final double price;

  CollectionModel({
    required this.imagePath,
    required this.name,
    required this.price,
  });
}

class PaddingUtility {
  final paddingTop = const EdgeInsets.only(top: 10);
  final paddingGeneral = const EdgeInsets.all(20);
  final paddingBottom = const EdgeInsets.only(bottom: 20);
  final paddingHorizontal = const EdgeInsets.symmetric(horizontal: 20);
}

class CollectionItems {
  late List<CollectionModel> items;

  CollectionItems() {
    items = [
      CollectionModel(imagePath: ProjectImages.imageCollection, name: "Abstarct Art", price: 3.4),
      CollectionModel(imagePath: ProjectImages.imageCollection, name: "Abstarct Art2", price: 3.4),
      CollectionModel(imagePath: ProjectImages.imageCollection, name: "Abstarct Art3", price: 3.4),
      CollectionModel(imagePath: ProjectImages.imageCollection, name: "Abstarct Art4", price: 3.4),
    ];
  }
}

class ProjectImages {
  static const imageCollection = "assets/png/image_collection.png";
}
