import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import '../../../../../../Models/fields/fields_model.dart';
import '../../../../../../api.dart';
import 'card_create_fields.dart';

class AllCardsFields extends StatefulWidget {
  final String enterpriseUid;
  final MapController mapController;
  const AllCardsFields({required this.enterpriseUid, required this.mapController, Key? key}) : super(key: key);

  @override
  State<AllCardsFields> createState() => _AllCardsFieldsState();
}

class _AllCardsFieldsState extends State<AllCardsFields> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAllFields(widget.enterpriseUid),
        builder: (context, AsyncSnapshot<List<FieldsModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      widget.mapController.move(snapshot.data![index].center, 16);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: CardCreateFields(
                        fieldName: snapshot.data![index].name,
                        onTapEdit: () {},
                        onTapDelete: () {
                          setState(() {
                            FirebaseFirestore.instance
                                .collection(COLLECTION_ENTERPRISE)
                                .doc(widget.enterpriseUid)
                                .collection("Fields")
                                .doc(snapshot.data![index].id)
                                .delete();
                          });
                        }),
                  ),
                );
              },
              itemCount: snapshot.data!.length,
            );
          } else
            return Container();
        });
  }
}
