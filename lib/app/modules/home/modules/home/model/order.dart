import 'package:new_marketplace_app/app/modules/home/model/product.dart';

class Order {
  DateTime dtCreate = DateTime.now().add(Duration(minutes: -20));
  int numPedido = 80045;
  String clientName = "João da Silva";
  String clientPhone = "(11) 98765-4321";
  String clientAddress = "Rua das Flores, 123 - Centro";
  String paymentMethod = "Cartão de Crédito";
  double totalValue = 0.0;
  String status = "Pendente";

  List<Product> products = [
    Product(
      name: "Coca-Cola 2L",
      value: 9.99,
      promotionalValue: 8.99,
      category: "Bebidas",
      sector: "Refrigerantes",
      description: "Refrigerante Coca-Cola 2 litros",
      quantityType: "2 unidades",
      stock: 50,
      barCode: "7891098765432",
      image: null,
    ),
    Product(
      name: "Pão Francês",
      value: 12.90,
      promotionalValue: 10.90,
      category: "Padaria",
      sector: "Pães",
      description: "Pão francês fresco",
      quantityType: "500g",
      stock: 100,
      barCode: "7891098765433",
      image: null,
    ),
    Product(
      name: "Queijo Mussarela",
      value: 25.90,
      promotionalValue: 22.90,
      category: "Laticínios",
      sector: "Queijos",
      description: "Queijo mussarela fatiado",
      quantityType: "300g",
      stock: 30,
      barCode: "7891098765434",
      image: null,
    ),
  ];

  Order() {
    calculateTotal();
  }

  void calculateTotal() {
    totalValue = 0.0;
    for (var product in products) {
      if (product.promotionalValue != null) {
        totalValue += product.promotionalValue!;
      } else if (product.value != null) {
        totalValue += product.value!;
      }
    }
  }
}
