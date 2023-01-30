import 'package:design/Pages/Sub_pages/Tab_bar_page/Adidas_pro.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Pages/Sub_pages/Tab_bar_page/uf_pro.dart';

class MySearchDelegate extends SearchDelegate {
  List<String> searchResults = ["", "", ""];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = "";
          }
        },
        icon: Icon(Icons.clear),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.shopping_cart),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.favorite),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.add_alert),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        return close(
          context,
          null,
        ); //close searchbar
      },
    );
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    print(query);

var allPro = uf_pro_name+AdidasProNameList;
var allImage = uf_pro_imageLinkList + AdidasImgList;
var results = allPro.where((element) => element.contains(query)).toList();


    return GridView.builder(
      itemCount:results.length,
      itemBuilder: (context, index) {
        final result = results[index];
        //final images = imageList[index];
        var productIndex = allPro.indexOf(result);
        return Product(
          PRODUCTname: result,
          img:allImage[productIndex]
              ,
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisExtent: 45.h,
      crossAxisSpacing: .1.w,
      mainAxisSpacing:.1.h,

    ),
    );
    //   return Product(
    //     Te: "lao",
    //     img:
    //     "https://assets.bwbx.io/images/users/iqjWHBFdfxIU/iGfQkiYlBOT8/v1/1200x-1.jpg",);
  }







 @override
Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    //List<String> suggestions = ["Gro", "fas", "per"];
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }
}
