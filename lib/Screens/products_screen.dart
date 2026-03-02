import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makeup_store/Screens/productDetails_screen.dart';
import 'package:makeup_store/bloc/cart_bloc/cart_bloc.dart';
import '../model/Product_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductsScreen extends StatefulWidget{
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  bool isLipProducts = true;
  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc,CartState>(
  listener: (context, state) {
    if(state.status==CartStatus.success){
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Item Added to cart"),
            backgroundColor: Colors.green,
          ),
      );
    }
  },
  child: Container(
      margin: .symmetric(horizontal: 4),
        child:Column(
      crossAxisAlignment: .start,
      spacing:8,
      children: [
        _buildSearch(),
        CarouselSlider(
          items: [
            _buildProducts("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQV7VfYqg5Fn2-y4QZKaothOLfuY7iXDuRNVA&s"," More than just mascara"),
            _buildProducts("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZ4urtr2aG39MXltVlJdpwu7DqwSGiOlKrUg&s"," All Your Glow Essentials"),
            _buildProducts("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTds4ZhYJtWSkMFSqmzEgcrTxHFc6qcn6jiQw&s"," pinky color"),

          ],
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            enlargeCenterPage: true,
          ),
        ),

         Text("New Collection",style: TextStyle(fontWeight: .bold,fontSize:20),),
        Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => setState(() => isLipProducts = true),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: isLipProducts ? Colors.pink.shade200 : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text("Lip Products",
                        style: TextStyle(fontWeight: FontWeight.bold,
                            color: isLipProducts ? Colors.white : Colors.black)),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => isLipProducts = false),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: !isLipProducts ? Colors.pink.shade200 : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text("Skin Products",
                        style: TextStyle(fontWeight: FontWeight.bold,
                            color: !isLipProducts ? Colors.white : Colors.black)),
                  ),
                ),
              ],
            ),
          ),
        ),
         Expanded(
         child: isLipProducts
             ?GridView.builder(
           shrinkWrap: true,
           itemCount:ProductItemModel.lipProductsList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 photos
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
           itemBuilder: (context, index) {
         return _buildProductCard2(ProductItemModel.lipProductsList[index]);

           },
        )
             : GridView.builder(
             shrinkWrap: true,
             itemCount:ProductItemModel.skinProductsList.length,
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2, // 2 photos
               mainAxisSpacing: 10,
               crossAxisSpacing: 10,
               childAspectRatio: 0.75,
             ),
             itemBuilder: (context, index) {
             return _buildProductCard2(ProductItemModel.skinProductsList[index]);
           },

         )
         )
      ],
        )
    ),
);
  }

Widget _buildSearch(){
    return Container(
      margin: .symmetric(horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'search item',
            prefixIcon: Icon(Icons.search,color: Colors.purple,),
            fillColor: Colors.purple.shade100,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )
        ),
      ),
    );
}

Widget _buildProducts ( String link,String text){
    return Container(
      margin: .only(left: 20),
      height: 200,
      //width: 200,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        borderRadius: .circular(20),
      ),
      child: Column(
        crossAxisAlignment: .center,
        spacing: 6,
        mainAxisSize: MainAxisSize.min,
        children: [
        AspectRatio(
        aspectRatio: 2,
        child: Image.network(link,
          width: double.infinity,
          fit: BoxFit.cover,),
        ),
          Text(text,style: TextStyle(fontWeight: .w600,fontSize: 15)),
        ],
      ),

    );
}

Widget _buildProductCard2(ProductItemModel product){
  return GestureDetector(
    onTap: (){
      print("go to product details screen!");
      Navigator.of(context).push(
        MaterialPageRoute(builder:( context)=>ProductdetailsScreen(product: product)),
      );
    },
      child:  Container(
    margin:.only(top: 7),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
    ),
    child: Stack(
      alignment: AlignmentDirectional.topEnd,
      children:[
        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Image.network(product.link, fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 8),
          Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(product.disc, style: TextStyle(fontSize: 12, color: Colors.grey)),
          Text("\$${product.price}",style:TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 35,
            child: ElevatedButton(
              onPressed: () {
                context.read<CartBloc>().add(AddToCartEvent(product));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFDECEF),
                foregroundColor: Colors.black,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text("Add to Cart", style: TextStyle(fontSize: 12)),
              ),
            )
           ],
           ),
        IconButton(
            onPressed:(){
              setState(() {
                // if (product.isFavourite) {
                //   product.isFavourite = false;
                // } else{
                //   product.isFavourite=true;
                // }
                product.isFavourite=!product.isFavourite;
              });
            },
            icon:product.isFavourite?
            const Icon(Icons.favorite_outlined,color: Colors.red):
          const  Icon(Icons.favorite_outline)
        )
     ],
    )
      )
  );
}
}

