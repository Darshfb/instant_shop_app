import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softagi/controller/add_or_remove%20_card_controller.dart';
import 'package:softagi/controller/card_data_contolloer.dart';
import 'package:softagi/controller/search_contrlloer.dart';
import 'package:softagi/view/widgets/custom_text.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../const.dart';
import '../../theme.dart';
import 'Descrption.dart';

class searchscreen extends StatefulWidget {
  const searchscreen({Key? key}) : super(key: key);

  @override
  _searchscreenState createState() => _searchscreenState();
}

class _searchscreenState extends State<searchscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:   TextFormField(
          style: TextStyle(color:(Get.isDarkMode)?Colors.white:Colors.black),
          // onEditingComplete: () {
          //   setState(() {
          //     getposts();
          //   });
          // },
          // onFieldSubmitted:(value){
          //  controller.change(value);
          // },
          onFieldSubmitted: (value) {
setState(() {
  value=text.text;
search();
});


            // setState(() {
            //  text.text=value;
            // });




          },
          controller: text,

          decoration: InputDecoration(

            hintStyle: TextStyle(color:(Get.isDarkMode)?Colors.white:Colors.black),
            hintText: 'Search',
            border: UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
          // controller: text,
          // onSaved:(value){
          //   setState(() {
          //     value=text.text;
          //
          //   });
          //
          // },
        ),

      ),
      body: FutureBuilder(
        future: search(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return (snapshot.hasData)?new StaggeredGridView.countBuilder(

            physics: BouncingScrollPhysics(),
            crossAxisCount: 2,
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) =>   Padding(
              padding: const EdgeInsets.only(left: 5,right: 5,top: 5),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    )
                ),
                color: Colors.grey[200],
                elevation: 7,


                child:  GestureDetector(

                  onTap: (){
                    Get.to(descriptionScreen(
                      name:snapshot.data[index].name ,
                      title: snapshot.data[index].name,
                      description: snapshot.data[index].description.toString(),
                      image: snapshot.data[index].image.toString(),
                      price: snapshot.data[index].price.toString(),
                      oldPrice: snapshot.data[index].old_price.toString(),

                    ));
                  },
                  child:
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Hero(tag: '${snapshot.data[index].name}',
                          child:FadeInImage.assetNetwork(
                            height: MediaQuery.of(context).size.height/6,
                            fit: BoxFit.fill,
                            placeholder: 'assets/images/loding.gif',
                            image: snapshot.data[index].image.toString(),
                          ), ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Container(

                            alignment: Alignment.topRight,
                            child: Text('${snapshot.data[index].name}',style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),textAlign: TextAlign.right,textDirection: TextDirection.rtl,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(

                                child: custom_text(style:newprice , text: '${snapshot.data[index].price}',),
                              ),
                              Container(

                              ),
                              IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined,color: Colors.black,))

                            ],
                          ),
                        ),
                        GetBuilder<Searchcontrller>(
                          init:  Searchcontrller(),
                          builder: ( controller) {
                            return Container(

                              child: IconButton(onPressed: (){
                                addremovecard(id: snapshot.data[index].id!);
                              },icon: Icon(Icons.shopping_cart_rounded,color: Colors.red[800],),iconSize: 30,),
                            );
                          },),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            mainAxisSpacing: 0.0,
            crossAxisSpacing: 0.0, staggeredTileBuilder: (int index)=> new StaggeredTile.fit(1),
          ):Center(child: CircularProgressIndicator());
        },

      ),
    );
  }
}



