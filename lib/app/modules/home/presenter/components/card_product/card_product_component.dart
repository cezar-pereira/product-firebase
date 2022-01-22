import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_firebase/app/modules/home/domain/entities/product_entity.dart';
import 'package:intl/intl.dart';

class CardProductComponent extends StatelessWidget {
  const CardProductComponent(
      {Key? key, required this.productEntity, required this.onRemove})
      : super(key: key);
  final ProductEntity productEntity;
  final ValueChanged onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        padding: const EdgeInsets.all(12),
        decoration:
            BoxDecoration(border: Border.all(width: 2, color: Colors.black12)),
        child: Row(
          children: [
            Container(
              width: 160,
              alignment: Alignment.center,
              child: CachedNetworkImage(
                progressIndicatorBuilder: (context, url, progress) =>
                    const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                width: 160,
                height: 180,
                imageUrl: productEntity.urlImg,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(productEntity.title,
                                overflow: TextOverflow.ellipsis),
                            Text("${formatDate(date: productEntity.createdAt)}")
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTapDown: (TapDownDetails details) {
                          _showPopupMenu(context, details.globalPosition);
                        },
                        child: const Icon(Icons.more_horiz),
                      )
                    ],
                  ),
                  Text(productEntity.type),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 30,
                        width: 130,
                        child: stars(rating: productEntity.rating),
                      ),
                      Text(
                          "R\$ ${productEntity.price.toString().replaceAll(".", ",")}")
                    ],
                  ),
                ],
              ),
            )),
          ],
        ));
  }

  void _showPopupMenu(context, Offset offset) async {
    double left = offset.dx;
    double top = offset.dy;
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, 0, 0),
      items: <PopupMenuEntry>[
        PopupMenuItem(
            child: const Text('Editar'),
            onTap: () {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                Get.toNamed('/product', arguments: productEntity);
              });
            }),
        PopupMenuItem(
            child: const Text('Remover'),
            onTap: () {
              onRemove(productEntity);
            }),
      ],
      elevation: 8.0,
    );
  }

  stars({required int rating}) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Icon(
          Icons.star,
          color: (index + 1) <= rating ? Colors.blue[700] : Colors.black38,
        );
      },
    );
  }

  formatDate({required DateTime date}) {
    final f = DateFormat('dd/MM/yyyy');
    return f.format(date);
  }
}
