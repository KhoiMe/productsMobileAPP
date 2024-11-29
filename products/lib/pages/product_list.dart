import 'package:flutter/material.dart';
import 'package:products/models/product_model.dart';

import '../services/api_service.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: loadProducts(),
    );
  }

  Widget loadProducts() {
    return FutureBuilder(
        future: APIService.getProducts(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ProductModel>?> model) {
          if (model.hasData) {
            return productList(model.data);
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  Widget productList(products) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(88, 36),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                onPressed: () {
                  Navigator.pushNamed(context, '/add-product');
                },
                child: const Text('Agregar Producto')),
            ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: cartItem(context, products[index]),
                    ),
                  );
                })
          ],
        )
      ],
    ));
  }

  Widget cartItem(context, ProductModel product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          child: Image.network(
            (product.productImage == null || product.productImage == '')
                ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlPq3HNrogtewh6giuHVuE18Tk7oflL20Z7w&s'
                : product.productImage!,
            height: 70,
            fit: BoxFit.scaleDown,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.productName ?? "",
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text("\$${product.productPrice}",
                    style: const TextStyle(color: Colors.black)),
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 180,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        child: const Icon(Icons.edit),
                        onTap: () {
                          print("Editar producto");
                          Navigator.of(context).pushNamed('/edit-product',
                              arguments: {'model': product});
                          // go to edit product route
                        },
                      ),
                      GestureDetector(
                          child: const Icon(Icons.delete),
                          onTap: () {
                              showDialog(context: context, builder:(BuildContext context) => 

                             AlertDialog(
                                title: const Text('Eliminar Producto'),
                                content: const SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text(
                                          "Seguro que quieres eliminar el producto?")
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  Row(children: [
                                    TextButton(
                                      child: const Text('Eliminar'),
                                      onPressed: () {
                                        APIService.deleteProduct(
                                            product.productName);
                                        Navigator.of(context).pushNamed('/');
                                      },
                                    ),
                                    TextButton(
                                      child: const Text('Cancelar'),
                                      onPressed: () {
                                        Navigator.of(context).pushNamed('/');
                                      },
                                    )
                                  ])
                                ]));
                            // print(product.productName);
                          })
                    ],
                  ),
                )
              ]),
        ),
      ],
    );
  }
}

class AcceptDialogue {
  const AcceptDialogue();
}
