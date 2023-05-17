import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:b_kreazi/components/stack_burger.dart';
import 'package:provider/provider.dart';
import 'package:b_kreazi/providers/burger_provider.dart';
import 'package:b_kreazi/providers/navigation_provider.dart';
import 'package:b_kreazi/pages/create_burger.dart';

class MenuCard extends StatefulWidget {
  const MenuCard({super.key, required this.product});
  final List product;

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  Widget _buildCard(produk, provBurger, provNav) => GridView.extent(
    maxCrossAxisExtent: 250,
    // padding: const EdgeInsets.all(10),
    mainAxisSpacing: 8,
    crossAxisSpacing: 8,
    childAspectRatio: 2/2.7,
    shrinkWrap: true,
    children: _buildGridTileList(produk, provBurger, provNav)
  );
  List<Card> _buildGridTileList(List products, provBurger, provNav) => List.generate(
    products.length, (i) => Card(
      elevation: 3,
      child: InkWell(
        onTap: () {
          provBurger.resetAll();
          provBurger.orderCreation = products[i];
          provNav.orderState = 'Addition';
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateBurger(back: false)));
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 2, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: LayoutBuilder(   // biar ukuran ikut mamak
                      builder: (BuildContext context, BoxConstraints constraints) {
                        return StackBurger(source: products[i], padding: 15, width: 150,);
                      }
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('${products[i]['Name']}', overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        '${NumberFormat.currency(locale: "id_ID", symbol: "Rp. ", decimalDigits: 0).format(products[i]['TtlPrice'])},-', 
                        style: const TextStyle(fontSize: 13, color: Colors.grey, decoration: TextDecoration.lineThrough),
                      ),
                      Text(
                        '${NumberFormat.currency(locale: "id_ID", symbol: "Rp. ", decimalDigits: 0).format(products[i]['TtlPrice']-products[i]["Discount"])},-', 
                        style: const TextStyle(fontSize: 16, color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    )
  );
  
  @override
  Widget build(BuildContext context) {
    final provBurger = Provider.of<BurgerProvider>(context);
    final provNav = Provider.of<NavigationProvider>(context);
    return _buildCard(widget.product, provBurger, provNav);
  }
}