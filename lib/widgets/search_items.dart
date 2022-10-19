import 'package:flutter/material.dart';
import '../models/order_model.dart';
import '../providers/changestatus.dart';
import '/config/colors.dart';
import 'package:provider/provider.dart';

class OrderList extends StatefulWidget {
  final int id;
  final List<Order?> orderList;
  // final String total;
  final int? tableNumber;

  const OrderList(
      {Key? key,
      required this.id,
      required this.orderList,
      // required this.total,
       this.tableNumber
      })
      : super(key: key);

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {

  @override
  Widget build(BuildContext context) {
    // print(widget.total);
    return
      Dismissible(
        key: UniqueKey(),

      background: Container(
        color: Colors.green,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: const Icon(
          Icons.save_alt,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text("Are you sure?"),
            content: const Text('This order is complete'),
            backgroundColor:const Color(0xffd9dad9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            actions: [
              MaterialButton(
                child: const Text('No'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              MaterialButton(
                child: const Text('Yes'),
                onPressed: () {
                  Provider.of<ChangeStatus>(context, listen: false).changestatus(widget.id);
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) {
      },
      child: Container(
        //padding: const EdgeInsets.all(8),
        //width: 300,
       // height: 250,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xffd9dad9),
          borderRadius: BorderRadius.circular(10),
        ),
        child:
        ExpansionTile(
          //controlAffinity: ListTileControlAffinity.leading,
          childrenPadding:
          const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          expandedCrossAxisAlignment: CrossAxisAlignment.end,

          maintainState: true,
          title: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
                "Table ${widget.tableNumber}",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          collapsedBackgroundColor: Colors.orange,
          // contents
          children: [
            ListView.builder(
              //scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.orderList.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('name :  ${widget.orderList[index]!.product!}',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text('quantity : ${widget.orderList[index]!.count!.toString()}',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('size : ${widget.orderList[index]!.size!}',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text('order_id : ${widget.id}',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),
                          ),

                        ],
                      ),
                    ),
                    const Divider()
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
