import 'package:new_marketplace_app/app/modules/home/model/product.dart';

class OrderEvent {
  final String status;
  final DateTime timestamp;
  final String? description;

  OrderEvent({required this.status, required this.timestamp, this.description});

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'timestamp': timestamp.toIso8601String(),
      'description': description,
    };
  }
}

class Order {
  DateTime dtCreate = DateTime.now().add(Duration(minutes: -20));
  int numPedido = 80045;
  String clientName = "João da Silva";
  String clientPhone = "(11) 98765-4321";
  String clientAddress = "Rua das Flores, 123 - Centro";
  String paymentMethod = "Cartão de Crédito";
  double totalValue = 0.0;
  String status = "Pendente";
  double deliveryFee = 5.0;
  List<OrderEvent> events = [];

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
      quantity: 2,
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
      quantity: 1,
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
      quantity: 2,
    ),
  ];

  Order() {
    calculateTotal();

    // Adicionar eventos de exemplo para demonstração
    final baseTime = dtCreate;

    // Evento inicial - pedido recebido
    events.add(
      OrderEvent(
        status: "Pedido Recebido",
        timestamp: baseTime,
        description: "Pedido recebido pelo sistema",
      ),
    );

    // Evento de confirmação
    events.add(
      OrderEvent(
        status: "Pedido Confirmado",
        timestamp: baseTime.add(Duration(minutes: 5)),
        description: "Pedido confirmado pelo estabelecimento",
      ),
    );

    // Evento de preparação
    events.add(
      OrderEvent(
        status: "Em Preparação",
        timestamp: baseTime.add(Duration(minutes: 10)),
        description: "Seu pedido está sendo preparado",
      ),
    );
  }

  void calculateTotal() {
    totalValue = 0.0;
    for (var product in products) {
      if (product.promotionalValue != null) {
        totalValue += product.promotionalValue! * product.quantity;
      } else if (product.value != null) {
        totalValue += product.value! * product.quantity;
      }
    }
  }

  void updateStatus(String newStatus, {String? description}) {
    status = newStatus;
    events.add(
      OrderEvent(
        status: newStatus,
        timestamp: DateTime.now(),
        description: description,
      ),
    );
  }
}

class CompletedOrder extends Order {
  CompletedOrder() {
    super.status = "Entregue";

    // Adicionar eventos específicos para pedidos concluídos
    final completionTime = dtCreate.add(Duration(minutes: 30));

    // Adicionar evento de "Pronto para Entrega"
    events.add(
      OrderEvent(
        status: "Pronto para Entrega",
        timestamp: dtCreate.add(Duration(minutes: 20)),
        description: "Pedido preparado e pronto para ser entregue",
      ),
    );

    // Adicionar evento de "Entregue"
    events.add(
      OrderEvent(
        status: "Entregue",
        timestamp: completionTime,
        description: "Pedido entregue com sucesso",
      ),
    );
  }
}
