import 'package:design/StateManagement/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class cart_page extends StatefulWidget {
  const cart_page({Key? key}) : super(key: key);

  @override
  State<cart_page> createState() => _cart_pageState();
}

class _cart_pageState extends State<cart_page> {





  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context).initialState(); //shared_pref initiate for Cart Products
   final _myList = context.watch<ProductProvider>().cartProductListGetter;
   final _myImage = context.watch<ProductProvider>().cartImageListGetter;







    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 24.w,),
            Text(
              "Cart",
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.white,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: _myList.length,
        itemBuilder: (_, index) {
          final currentProduct = _myList[index];
          return Card(
              elevation: 4.sp,
              child: ListTile(
                leading: Container(
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    height: double.infinity,
                    width: 14.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              _myImage[index],
                            ),
                            fit: BoxFit.fill)),
                  ),
                ),
                title: Text(
                  currentProduct,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                subtitle: Text("[Provider not set yet]"),
                trailing: ElevatedButton(
                  onPressed: () {
                    context
                        .read<ProductProvider>()
                        .removeCartProduct(currentProduct);
                    context
                        .read<ProductProvider>()
                        .removeACartImage(_myImage[index]);
                  },
                  child: Text(
                    "Remove",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w900,
                        fontSize: 8.sp
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
