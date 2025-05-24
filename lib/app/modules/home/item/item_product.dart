import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_marketplace_app/app/component/simple/line_view_widget.dart';
import 'package:new_marketplace_app/app/modules/home/model/product.dart';
import 'package:new_marketplace_app/app/utils/image_utils.dart';
import 'package:new_marketplace_app/app/utils/theme/app_theme_utils.dart';

class ItemProduct extends StatefulWidget {
  final Product product;

  ItemProduct(this.product);

  @override
  _ItemProductState createState() => _ItemProductState();
}

class _ItemProductState extends State<ItemProduct> {
  final currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  @override
  Widget build(BuildContext context) {
    // Calcular o subtotal do produto (preço x quantidade)
    final subtotal =
        widget.product.promotionalValue != null
            ? widget.product.promotionalValue! * widget.product.quantity
            : widget.product.value != null
            ? widget.product.value! * widget.product.quantity
            : 0.0;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagem do produto
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child:
                    widget.product.image != null
                        ? ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: ImageUtils.imageFromBase64String(
                            widget.product.image,
                            fit: BoxFit.cover,
                          ),
                        )
                        : Center(
                          child: Icon(
                            Icons.image,
                            color: Colors.grey[400],
                            size: 30,
                          ),
                        ),
              ),
              SizedBox(width: 12),
              // Informações do produto
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.product.name ?? 'Produto Marketplace',
                            style: AppThemeUtils.normalBoldSize(fontSize: 16),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppThemeUtils.colorPrimary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "${widget.product.quantity}x",
                            style: AppThemeUtils.normalBoldSize(
                              fontSize: 14,
                              color: AppThemeUtils.colorPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (widget.product.description != null &&
                        widget.product.description!.isNotEmpty) ...[
                      SizedBox(height: 4),
                      Text(
                        widget.product.description!,
                        style: AppThemeUtils.normalSize(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppThemeUtils.colorPrimary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            widget.product.quantityType ?? '',
                            style: AppThemeUtils.normalSize(
                              fontSize: 12,
                              color: AppThemeUtils.colorPrimary,
                            ),
                          ),
                        ),
                        Text(
                          "Subtotal: ${currencyFormat.format(subtotal)}",
                          style: AppThemeUtils.normalBoldSize(
                            fontSize: 12,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8),
              // Preço
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (widget.product.promotionalValue != null) ...[
                    // Preço promocional
                    Text(
                      currencyFormat.format(widget.product.value),
                      style: AppThemeUtils.normalSize(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Text(
                      currencyFormat.format(widget.product.promotionalValue),
                      style: AppThemeUtils.normalBoldSize(
                        fontSize: 16,
                        color: AppThemeUtils.colorGreenSuccess,
                      ),
                    ),
                  ] else if (widget.product.value != null) ...[
                    // Preço normal
                    Text(
                      currencyFormat.format(widget.product.value),
                      style: AppThemeUtils.normalBoldSize(
                        fontSize: 16,
                        color: AppThemeUtils.colorPrimary,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
        lineViewWidget(height: 1, color: Colors.grey[200]),
      ],
    );
  }
}
