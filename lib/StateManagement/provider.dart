import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProductProvider with ChangeNotifier {
  void initialState() {
    SyncCartImagesDataWithProvider();
    SyncCartProductDataWithProvider();

  }
  void initialState1(){
    SyncFavoProducDataWithProvider();
   SyncFavoProducImageDataWithProvider();
   }

  List<String> _CartImageList = [];
  List get CartImageList {
    return _CartImageList;
  }

  void AddCartImage(String n) {
    _CartImageList.add(n);
    updateCartImageSharedPrefrences();
    notifyListeners();
  }

  void RemoveCartImage(String n) {
    _CartImageList.remove(n);
    updateCartImageSharedPrefrences();
    notifyListeners();
  }

  Future<void> updateCartImageSharedPrefrences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> CartImages = _CartImageList;
    await preferences.setStringList("_CartImageList", CartImages);
  }

  Future SyncCartImagesDataWithProvider() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var result = preferences.getStringList("_CartImageList");
    if (result != null) {
      _CartImageList = result;
    }
    notifyListeners();
  }
  List<String> _CartProductName = [];

  List get CartProductList {
    return _CartProductName;
  }
  void AddCartProduct(String n) {
    _CartProductName.add(n);
    updateCartProductSharedPrefrences();
    notifyListeners();
  }

  void RemoveCartProduct(String n) {
    _CartProductName.remove(n);
    updateCartProductSharedPrefrences();
    notifyListeners();
  }
  Future<void> updateCartProductSharedPrefrences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> CartProducts = _CartProductName;
    await preferences.setStringList("_CartProductList", CartProducts);
  }
  Future SyncCartProductDataWithProvider() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var result = preferences.getStringList("_CartProductList");
    if (result != null) {
      _CartProductName = result;
    }
    notifyListeners();
  }

  List<String> _productImgeList = [];
  List get productImgeList {
    return _productImgeList;
  }

  void ImageAddToList(String p) {
    _productImgeList.add(p);
    updateFavoProductImageSharedPrefrences();
    notifyListeners();
  }

  void ImageRemoveFromList(String p) {
    _productImgeList.remove(p);
    updateFavoProductImageSharedPrefrences();
    notifyListeners();
  }

  List<String> _productNameList = [];
  List get productNameList {
    return _productNameList;
  }

  void NameAddToList(String p) {
    _productNameList.add(p);
    updateFavoProductSharedPrefrences();
    notifyListeners();
  }

  void NameRemoveFromList(String p) {
    _productNameList.remove(p);
    updateFavoProductSharedPrefrences();
    notifyListeners();
  }

  Future<void> updateFavoProductSharedPrefrences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> ProductNametList = _productNameList;
    await preferences.setStringList("_favotList", ProductNametList);
  }

  Future SyncFavoProducDataWithProvider() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var result = preferences.getStringList("_favotList");
    if (result!=null) {
      _productNameList = result;
    }
    notifyListeners();
  }

  Future<void> updateFavoProductImageSharedPrefrences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List <String> ProductImages =_productImgeList;
    await preferences.setStringList("_favoImageList", ProductImages);
  }

  Future SyncFavoProducImageDataWithProvider() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var resultImage = preferences.getStringList("_favoImageList");
    if(resultImage!=null){
      _productImgeList = resultImage;
    }
    notifyListeners();
  }
}
