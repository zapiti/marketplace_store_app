import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_app/app/modules/home/item/item_product_new.dart';
import 'package:new_marketplace_app/app/modules/home/modules/home/model/order.dart';
import 'package:new_marketplace_app/app/utils/theme/app_theme_utils.dart';
import 'package:intl/intl.dart';

class DetailPendingPage extends StatefulWidget {
  final Order _order;

  DetailPendingPage(this._order);

  @override
  _DetailPendingPageState createState() => _DetailPendingPageState();
}

class _DetailPendingPageState extends State<DetailPendingPage> {
  final currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  final dateFormat = DateFormat('dd/MM/yyyy');
  final timeFormat = DateFormat('HH:mm');

  @override
  void initState() {
    super.initState();
  }

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
                    _buildProductsList(),
                    SizedBox(height: 8),
                    _buildOrderSummary(),
                  ],
                ),
              ),
            ),
            _buildActionButton(),
          ],
        ),
      ),
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
            separatorBuilder: (context, index) => Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey[200],
            ),
            itemBuilder: (context, index) => ItemProductNew(widget._order.products[index]),
          ),
        ],
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
              border: Border.all(color: AppThemeUtils.colorPrimary.withOpacity(0.3)),
              color: AppThemeUtils.colorPrimary.withOpacity(0.05),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: AppThemeUtils.colorPrimary,
                  size: 20,
                ),
                SizedBox(width: 8),
                Text(
                  "Pedido #${widget._order.numPedido}",
                  style: AppThemeUtils.normalBoldSize(
                    fontSize: 18,
                    color: AppThemeUtils.colorPrimary,
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
                  color: AppThemeUtils.colorGreenSuccess,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  widget._order.status,
                  style: AppThemeUtils.normalBoldSize(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 14,
                    color: Colors.grey[600],
                  ),
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
                  Icon(
                    Icons.access_time,
                    size: 14,
                    color: Colors.grey[600],
                  ),
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
              Icon(
                Icons.person,
                color: AppThemeUtils.colorPrimary,
                size: 20,
              ),
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
        Icon(
          icon,
          size: 16,
          color: Colors.grey[600],
        ),
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
            Text(
              value,
              style: AppThemeUtils.normalBoldSize(fontSize: 14),
            ),
          ],
        ),
      ],
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
              Icon(
                Icons.receipt,
                color: AppThemeUtils.colorPrimary,
                size: 20,
              ),
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
              Text(
                "Itens",
                style: AppThemeUtils.normalSize(fontSize: 14),
              ),
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
              Text(
                "Subtotal",
                style: AppThemeUtils.normalSize(fontSize: 14),
              ),
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
                currencyFormat.format(5.0),
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
                currencyFormat.format(widget._order.totalValue + 5.0),
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

  Widget _buildActionButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppThemeUtils.colorGreenSuccess,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 8),
            Text(
              "PEDIDO PRONTO PARA ENTREGA",
              style: AppThemeUtils.normalBoldSize(
                color: Colors.white,
              ),
            ),
          ],
        ),
        onPressed: () {
          _showConfirmationDialog();
        },
      ),
    );
  }
  
  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirmar conclusão"),
        content: Text(
          "Tem certeza que deseja marcar este pedido como pronto para entrega?",
        ),
        actions: [
          TextButton(
            child: Text("CANCELAR"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppThemeUtils.colorGreenSuccess,
            ),
            child: Text("CONFIRMAR"),
            onPressed: () {
              Navigator.of(context).pop();  // Fecha o diálogo
              Navigator.of(context).pop();  // Volta para a tela anterior
            },
          ),
        ],
      ),
    );
  }
}
