import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do pedido"),
        centerTitle: true,
        backgroundColor: AppThemeUtils.colorPrimary,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          _buildOrderHeader(),
          lineViewWidget(),
          _buildClientInfo(),
          lineViewWidget(),
          Expanded(
            child: ListView.builder(
              itemCount: widget._order.products.length,
              itemBuilder:
                  (context, index) =>
                      ItemProduct(widget._order.products[index]),
            ),
          ),
          _buildOrderSummary(),
        ],
      ),
    );
  }

  Widget _buildOrderHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            "Número do pedido: #${widget._order.numPedido}",
            style: AppThemeUtils.normalBoldSize(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
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
              SizedBox(width: 8),
              Text(
                DateFormat('dd/MM/yyyy HH:mm').format(widget._order.dtCreate),
                style: AppThemeUtils.normalSize(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildClientInfo() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Informações do cliente",
            style: AppThemeUtils.normalBoldSize(fontSize: 16),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.person, size: 16, color: AppThemeUtils.colorPrimary),
              SizedBox(width: 8),
              Text(
                widget._order.clientName,
                style: AppThemeUtils.normalSize(fontSize: 14),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.phone, size: 16, color: AppThemeUtils.colorPrimary),
              SizedBox(width: 8),
              Text(
                widget._order.clientPhone,
                style: AppThemeUtils.normalSize(fontSize: 14),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 16,
                color: AppThemeUtils.colorPrimary,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  widget._order.clientAddress,
                  style: AppThemeUtils.normalSize(fontSize: 14),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.payment, size: 16, color: AppThemeUtils.colorPrimary),
              SizedBox(width: 8),
              Text(
                widget._order.paymentMethod,
                style: AppThemeUtils.normalSize(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border(top: BorderSide(color: Colors.grey[300]!)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total do pedido:",
                style: AppThemeUtils.normalBoldSize(fontSize: 16),
              ),
              Text(
                currencyFormat.format(widget._order.totalValue),
                style: AppThemeUtils.normalBoldSize(
                  fontSize: 16,
                  color: AppThemeUtils.colorPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Itens:", style: AppThemeUtils.normalSize(fontSize: 14)),
              Text(
                "${widget._order.products.length} ${widget._order.products.length == 1 ? 'item' : 'itens'}",
                style: AppThemeUtils.normalSize(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
