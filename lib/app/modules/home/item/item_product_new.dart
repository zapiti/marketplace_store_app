import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_marketplace_app/app/modules/home/model/product.dart';
import 'package:new_marketplace_app/app/utils/image_utils.dart';
import 'package:new_marketplace_app/app/utils/theme/app_theme_utils.dart';

class ItemProductNew extends StatefulWidget {
  final Product product;

  ItemProductNew(this.product);

  @override
  _ItemProductNewState createState() => _ItemProductNewState();
}

class _ItemProductNewState extends State<ItemProductNew> {
  final currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  
  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: widget.product.image != null
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
                Text(
                  widget.product.name ?? 'Produto sem nome',
                  style: AppThemeUtils.normalBoldSize(fontSize: 16),
                ),
                if (widget.product.description != null && widget.product.description!.isNotEmpty) ...[
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
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
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
    );
  }
}
