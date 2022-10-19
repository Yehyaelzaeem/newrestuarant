import 'package:flutter/material.dart';
import 'package:orders/models/order_model.dart';
import 'package:orders/providers/order_provider.dart';
import 'package:orders/widgets/search_items.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<OrderModel>>? futurePost;

  @override
  initState(){
    super.initState();
    futurePost =  Provider.of<OrderProvider>(context, listen: false).fetchPost();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Orders',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          actions: [
            IconButton(onPressed: (){
              setState(() {
                futurePost =  Provider.of<OrderProvider>(context, listen: false).fetchPost();
              });

            }, icon: const Icon(Icons.refresh))
          ],

          backgroundColor: const Color(0xffd6b738),
        ),
        body: FutureBuilder<List<OrderModel>>(
            future: futurePost,
            builder: (context, snapshot) {
              print( snapshot.data);
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final data = snapshot.data![index];
                      if(data.order !=null){
                        return OrderList(
                          id: data.id!,
                          orderList: data.order!,
                          tableNumber: data.tableNumber,
                        );

                      }
                      else{
                        return const Center(
                        );
                      }
                    });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
    );
  }
}
