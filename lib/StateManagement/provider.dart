import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProductProvider with ChangeNotifier {
  void initialState() {
    syncCartImagesDataWithProvider();
    syncCartProductDataWithProvider();

  }
  void initialState1(){
    syncFavoProducDataWithProvider();
   syncFavoProducImageDataWithProvider();
   }

  List<String> _cartImageList = [];
  List get cartImageListGetter {
    return _cartImageList;
  }

  void addCartImageInList(String n) {
    _cartImageList.add(n);
    updateCartImageSharedPrefrences();
    notifyListeners();
  }

  void removeACartImage(String n) {
    _cartImageList.remove(n);
    updateCartImageSharedPrefrences();
    notifyListeners();
  }

  Future<void> updateCartImageSharedPrefrences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> cartImages = _cartImageList;
    await preferences.setStringList("_CartImageList", cartImages);
  }

  Future syncCartImagesDataWithProvider() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var result = preferences.getStringList("_CartImageList");
    if (result != null) {
      _cartImageList = result;
    }
    notifyListeners();
  }
  List<String> _cartProductNameList = [];

  List get cartProductListGetter {
    return _cartProductNameList;
  }
  void addACartProduct(String n) {
    _cartProductNameList.add(n);
    updateCartProductSharedPrefrences();
    notifyListeners();
  }

  void removeCartProduct(String n) {
    _cartProductNameList.remove(n);
    updateCartProductSharedPrefrences();
    notifyListeners();
  }
  Future<void> updateCartProductSharedPrefrences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> cartProducts = _cartProductNameList;
    await preferences.setStringList("_CartProductList", cartProducts);
  }
  Future syncCartProductDataWithProvider() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var result = preferences.getStringList("_CartProductList");
    if (result != null) {
      _cartProductNameList = result;
    }
    notifyListeners();
  }

  List<String> _productImgeList = [];
  List get productImgeList {
    return _productImgeList;
  }

  void aImageAddToList(String p) {
    _productImgeList.add(p);
    updateFavoProductImageSharedPrefrences();
    notifyListeners();
  }

  void aImageRemoveFromList(String p) {
    _productImgeList.remove(p);
    updateFavoProductImageSharedPrefrences();
    notifyListeners();
  }

  List<String> _productNameList = [];
  List get productNameList {
    return _productNameList;
  }

  void aNameAddToList(String p) {
    _productNameList.add(p);
    updateFavoProductSharedPrefrences();
    notifyListeners();
  }

  void aNameRemoveFromList(String p) {
    _productNameList.remove(p);
    updateFavoProductSharedPrefrences();
    notifyListeners();
  }

  Future<void> updateFavoProductSharedPrefrences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> productNametList = _productNameList;
    await preferences.setStringList("_favotList", productNametList);
  }

  Future syncFavoProducDataWithProvider() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var result = preferences.getStringList("_favotList");
    if (result!=null) {
      _productNameList = result;
    }
    notifyListeners();
  }

  Future<void> updateFavoProductImageSharedPrefrences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List <String> productImages =_productImgeList;
    await preferences.setStringList("_favoImageList", productImages);
  }

  Future syncFavoProducImageDataWithProvider() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var resultImage = preferences.getStringList("_favoImageList");
    if(resultImage!=null){
      _productImgeList = resultImage;
    }
    notifyListeners();
  }
}
