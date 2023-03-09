import 'package:design/StateManagement/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class favorite_page extends StatefulWidget {
  const favorite_page({Key? key}) : super(key: key);

  @override
  State<favorite_page> createState() => _favorite_pageState();
}

class _favorite_pageState extends State<favorite_page> {
  @override
  Widget build(BuildContext context) {

    Provider.of<ProductProvider>(context).initialState1();//shared_pref initiate for Favorite Products
    Provider.of<ProductProvider>(context).initialState();//shared_pref initiate for Cart Products
    final _myList1 = context.watch<ProductProvider>().productNameList;
    final _myImage1 = context.watch<ProductProvider>().productImgeList;
    var cartProduct = context.watch<ProductProvider>().CartProductList;//for operation add & remove to cart
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          children: [
            SizedBox(width: 20.w,),
            Text(
              "Favorite",
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
        itemCount: _myList1.length,
        itemBuilder: (_, index) {

          final currentProduct = _myList1[index];
          return Card(
              elevation: 4.sp,
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        height: double.infinity,
                        width: 14.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  _myImage1[index],
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
                    trailing: IconButton(
                      onPressed: () {
                        if (!cartProduct.contains(currentProduct)) {
                          context
                              .read<ProductProvider>()
                              .AddCartProduct(currentProduct);//Cart product name
                          context
                              .read<ProductProvider>()
                              .AddCartImage(_myImage1[index]);//Cart picture
                        } else {
                          context
                              .read<ProductProvider>()
                              .RemoveCartProduct(currentProduct);
                          context
                              .read<ProductProvider>()
                              .RemoveCartImage(_myImage1[index]);
                        }
                      },
                      icon: Icon(
                        Icons.add_shopping_cart_sharp,
                        color: cartProduct.contains(currentProduct)
                            ? Colors.blue
                            : Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    width: 100.w,
                    height: 5.h,
                    color: Colors.grey,
                    child: TextButton(
                      child: Text("Remove",style: TextStyle(color: Colors.red),),
                      onPressed: (){
                        context
                            .read<ProductProvider>()
                            .NameRemoveFromList(currentProduct);//remove favorite product
                        context
                            .read<ProductProvider>()
                            .ImageRemoveFromList(_myImage1[index]);//remove favorite product picture
                      },

                    ),
                  )
                ],
              ),
          );
        },
      ),
    );
  }
}
