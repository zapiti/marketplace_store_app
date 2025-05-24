import 'package:flutter/material.dart';
import 'package:new_marketplace_app/app/component/simple/line_view_widget.dart';
import 'package:new_marketplace_app/app/modules/home/item/item_product_new.dart';
import 'package:new_marketplace_app/app/modules/home/modules/home/model/order.dart';
import 'package:new_marketplace_app/app/utils/theme/app_theme_utils.dart';
import 'package:intl/intl.dart';

class DetailHistoryPage extends StatefulWidget {
  final Order _order;

  DetailHistoryPage(this._order);

  @override
  _DetailHistoryPageState createState() => _DetailHistoryPageState();
}

class _DetailHistoryPageState extends State<DetailHistoryPage> {
  final currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  final dateFormat = DateFormat('dd/MM/yyyy');
  final timeFormat = DateFormat('HH:mm');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do pedido"),
        centerTitle: true,
        backgroundColor: AppThemeUtils.colorPrimary,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: Container(
        color: Colors.grey[50],
        child: Column(
          children: [
            _buildOrderHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildClientInfo(),
                    SizedBox(height: 8),
                    _buildStatusStepper(),
                    SizedBox(height: 8),
                    _buildProductsList(),
                    SizedBox(height: 8),
                    _buildOrderSummary(),
                    SizedBox(height: 8),
                    _buildOrderTimeline(),
                    SizedBox(height: 8),
                    _buildStatusStepper(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.withOpacity(0.3)),
              color: Colors.blue.withOpacity(0.05),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.shopping_cart, color: Colors.blue, size: 20),
                SizedBox(width: 8),
                Text(
                  "Pedido #${widget._order.numPedido}",
                  style: AppThemeUtils.normalBoldSize(
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Concluído",
                  style: AppThemeUtils.normalBoldSize(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 14, color: Colors.grey[600]),
                  SizedBox(width: 4),
                  Text(
                    dateFormat.format(widget._order.dtCreate),
                    style: AppThemeUtils.normalSize(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              SizedBox(width: 8),
              Row(
                children: [
                  Icon(Icons.access_time, size: 14, color: Colors.grey[600]),
                  SizedBox(width: 4),
                  Text(
                    timeFormat.format(widget._order.dtCreate),
                    style: AppThemeUtils.normalSize(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildClientInfo() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person, color: AppThemeUtils.colorPrimary, size: 20),
              SizedBox(width: 8),
              Text(
                "Informações do cliente",
                style: AppThemeUtils.normalBoldSize(fontSize: 16),
              ),
            ],
          ),
          Divider(height: 24, thickness: 1, color: Colors.grey[200]),
          _buildClientInfoRow(
            icon: Icons.person_outline,
            label: "Nome",
            value: widget._order.clientName,
          ),
          SizedBox(height: 8),
          _buildClientInfoRow(
            icon: Icons.phone,
            label: "Telefone",
            value: widget._order.clientPhone,
          ),
          SizedBox(height: 8),
          _buildClientInfoRow(
            icon: Icons.location_on,
            label: "Endereço",
            value: widget._order.clientAddress,
          ),
          SizedBox(height: 8),
          _buildClientInfoRow(
            icon: Icons.payment,
            label: "Pagamento",
            value: widget._order.paymentMethod,
          ),
        ],
      ),
    );
  }

  Widget _buildClientInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppThemeUtils.normalSize(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 2),
            Text(value, style: AppThemeUtils.normalBoldSize(fontSize: 14)),
          ],
        ),
      ],
    );
  }

  Widget _buildProductsList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  Icons.shopping_bag,
                  color: AppThemeUtils.colorPrimary,
                  size: 20,
                ),
                SizedBox(width: 8),
                Text(
                  "Produtos",
                  style: AppThemeUtils.normalBoldSize(fontSize: 16),
                ),
              ],
            ),
          ),
          Divider(height: 1, thickness: 1, color: Colors.grey[200]),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget._order.products.length,
            separatorBuilder:
                (context, index) =>
                    Divider(height: 1, thickness: 1, color: Colors.grey[200]),
            itemBuilder:
                (context, index) =>
                    ItemProductNew(widget._order.products[index]),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.receipt, color: AppThemeUtils.colorPrimary, size: 20),
              SizedBox(width: 8),
              Text(
                "Resumo do pedido",
                style: AppThemeUtils.normalBoldSize(fontSize: 16),
              ),
            ],
          ),
          Divider(height: 24, thickness: 1, color: Colors.grey[200]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Itens", style: AppThemeUtils.normalSize(fontSize: 14)),
              Text(
                "${widget._order.products.length} ${widget._order.products.length == 1 ? 'item' : 'itens'}",
                style: AppThemeUtils.normalBoldSize(fontSize: 14),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Subtotal", style: AppThemeUtils.normalSize(fontSize: 14)),
              Text(
                currencyFormat.format(widget._order.totalValue),
                style: AppThemeUtils.normalBoldSize(fontSize: 14),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Taxa de entrega",
                style: AppThemeUtils.normalSize(fontSize: 14),
              ),
              Text(
                currencyFormat.format(widget._order.deliveryFee),
                style: AppThemeUtils.normalBoldSize(fontSize: 14),
              ),
            ],
          ),
          Divider(height: 16, thickness: 1, color: Colors.grey[200]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: AppThemeUtils.normalBoldSize(
                  fontSize: 16,
                  color: AppThemeUtils.colorPrimary,
                ),
              ),
              Text(
                currencyFormat.format(
                  widget._order.totalValue + widget._order.deliveryFee,
                ),
                style: AppThemeUtils.normalBoldSize(
                  fontSize: 18,
                  color: AppThemeUtils.colorPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderTimeline() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.history, color: AppThemeUtils.colorPrimary, size: 20),
              SizedBox(width: 8),
              Text(
                "Histórico do pedido",
                style: AppThemeUtils.normalBoldSize(fontSize: 16),
              ),
            ],
          ),
          Divider(height: 24, thickness: 1, color: Colors.grey[200]),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget._order.events.length,
            itemBuilder: (context, index) {
              final event = widget._order.events[index];
              final isLast = index == widget._order.events.length - 1;

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: AppThemeUtils.colorPrimary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      if (!isLast)
                        Container(
                          width: 2,
                          height: 40,
                          color: Colors.grey[300],
                        ),
                    ],
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.status,
                          style: AppThemeUtils.normalBoldSize(fontSize: 14),
                        ),
                        SizedBox(height: 2),
                        if (event.description != null) ...[
                          Text(
                            event.description!,
                            style: AppThemeUtils.normalSize(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 2),
                        ],
                        Text(
                          dateFormat.format(event.timestamp) +
                              " às " +
                              timeFormat.format(event.timestamp),
                          style: AppThemeUtils.normalSize(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                        SizedBox(height: isLast ? 0 : 16),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStatusStepper() {
    // Definir os possíveis status de um pedido
    final statusSteps = [
      "Pedido Recebido",
      "Pedido Confirmado",
      "Em Preparação",
      "Pronto para Entrega",
      "Entregue",
    ];

    // Encontrar o índice do status atual
    int currentStatusIndex = 0;
    final lastEvent =
        widget._order.events.isNotEmpty ? widget._order.events.last : null;

    if (lastEvent != null) {
      // Encontrar o índice correspondente ao status do último evento
      final index = statusSteps.indexOf(lastEvent.status);
      if (index >= 0) {
        currentStatusIndex = index;
      }
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.timeline, color: AppThemeUtils.colorPrimary, size: 20),
              SizedBox(width: 8),
              Text(
                "Status do pedido",
                style: AppThemeUtils.normalBoldSize(fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(statusSteps.length, (index) {
              bool isActive = index <= currentStatusIndex;
              bool isLast = index == statusSteps.length - 1;

              return Expanded(
                child: Row(
                  children: [
                    // Círculo de status
                    Column(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color:
                                isActive
                                    ? AppThemeUtils.colorPrimary
                                    : Colors.grey[300],
                            shape: BoxShape.circle,
                            border: Border.all(
                              color:
                                  isActive
                                      ? AppThemeUtils.colorPrimary
                                      : Colors.grey[400]!,
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                        SizedBox(height: 4),
                        Container(
                          width: 50,
                          child: Text(
                            statusSteps[index].split(' ')[0],
                            textAlign: TextAlign.center,
                            style: AppThemeUtils.normalSize(
                              fontSize: 10,
                              color:
                                  isActive
                                      ? AppThemeUtils.colorPrimary
                                      : Colors.grey[600],
                              fontWeight:
                                  isActive
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Linha conectora (exceto no último item)
                    if (!isLast)
                      Expanded(
                        child: Container(
                          height: 2,
                          color:
                              index < currentStatusIndex
                                  ? AppThemeUtils.colorPrimary
                                  : Colors.grey[300],
                        ),
                      ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
