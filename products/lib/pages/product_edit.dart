import 'dart:ui';

import 'package:flutter/material.dart';
// services & models
import 'package:products/models/product_model.dart';
import 'package:products/services/api_service.dart';
// utils
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class ProductEdit extends StatefulWidget {
  const ProductEdit({super.key});

  @override
  State<ProductEdit> createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  ProductModel? productModel = ProductModel.fromJson({});
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Editar producto"),
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: Form(key: globalFormKey, child: productForm()),
    ));
  }

  Widget productForm() {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final product = args?['model'];
    productModel!.id = product.id;
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          child: FormHelper.inputFieldWidget(context, "ProductName", "Nombre",
              (onValidateVal) {
            if (onValidateVal.isEmpty) {
              return 'El nombre del producto es obligatorio';
            }
          }, (onSavedVal) {
            productModel!.productName = onSavedVal;
          },
              prefixIcon: const Icon(Icons.person),
              initialValue: product.productName, // para editar un producto
              obscureText: false,
              borderFocusColor: Colors.black,
              borderColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.7),
              textColor: Colors.black,
              borderRadius: 10,
              prefixIconColor: Colors.blue,
              showPrefixIcon: true),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          child: FormHelper.inputFieldWidget(
            context,
            "productDescription",
            "Descripcion",
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return 'La descripcion del producto es obligatoria';
              }
            },
            (onSavedVal) {
              productModel!.productDescription = onSavedVal;
            },
            prefixIcon: const Icon(Icons.description),
            initialValue: product.productDescription,
            obscureText: false,
            borderFocusColor: Colors.black,
            borderColor: Colors.black,
            hintColor: Colors.black.withOpacity(0.7),
            textColor: Colors.black,
            borderRadius: 10,
            prefixIconColor: Colors.blue,
            showPrefixIcon: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          child: FormHelper.inputFieldWidget(
            context,
            "productImage",
            "Imagen",
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return 'La imagen del producto es obligatoria';
              }
            },
            (onSavedVal) {
              productModel!.productImage = onSavedVal;
            },
            maxLength: 500,
            prefixIcon: const Icon(Icons.image),
            initialValue: product.productImage,
            obscureText: false,
            borderFocusColor: Colors.black,
            borderColor: Colors.black,
            hintColor: Colors.black.withOpacity(0.7),
            textColor: Colors.black,
            borderRadius: 10,
            prefixIconColor: Colors.blue,
            showPrefixIcon: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          child: FormHelper.inputFieldWidget(
            context,
            "productPrice",
            "Precio",
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return 'El precio del producto es obligatorio';
              }
            },
            (onSavedVal) {
              productModel!.productPrice = int.tryParse(onSavedVal) ?? 0;
            },
            prefixIcon: const Icon(Icons.monetization_on),
            initialValue: product.productPrice.toString(),
            obscureText: false,
            borderFocusColor: Colors.black,
            borderColor: Colors.black,
            hintColor: Colors.black.withOpacity(0.7),
            textColor: Colors.black,
            borderRadius: 10,
            prefixIconColor: Colors.blue,
            showPrefixIcon: true,
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: FormHelper.submitButton("Guardar", () {
            if (validateAndSave()) {
              print(productModel?.toJson());
              APIService.updateProduct(productModel).then((response) {
                if (response) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                } else {
                  FormHelper.showSimpleAlertDialog(context, "Error",
                      "hubo un error al editar el producto", "OK", () {
                    Navigator.of(context).pop();
                  });
                }
              });
            }
          },
              btnColor: HexColor("283571"),
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 10),
        ),
      ],
    ));
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
