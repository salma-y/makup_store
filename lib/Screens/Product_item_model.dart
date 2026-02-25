 class ProductItemModel {
   final String link;
   final String name;
   final String disc;
   final double price;
   bool isFavourite;
   int quantity;

   ProductItemModel(this.link,
       this.name,
       this.disc,
       this.price, {
         this.isFavourite = false,
         this.quantity = 1,
       });


   static List<ProductItemModel> lipProductsList = [
     ProductItemModel(
         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPPgx1oSEWFqCpmoUrruWADNH59o4WH1KMag&s",
         "Lipstik",
         "High-pigment matte red that stays all day and night",
         32),
     ProductItemModel(
         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxv_xwXONSYWlnhxggrKzsmLKXYMoziSlKrQ&s",
         "lip Gloss",
         "Mario's highest-shine lip gloss that instantly hydrates",
         45),
     ProductItemModel(
         "https://www.faces.eg/dw/image/v2/BJSM_PRD/on/demandware.static/-/Sites-faces-master-catalog/default/dwdbd96674/images/new%20images/009114802096_1.jpg?sw=800&sh=800",
         "Lip Oil",
         "Dior Lip Glow Oil",
         15),
     ProductItemModel(
         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmABHlXm-a2iioIzQTGosF3Qzsfda_SMZP5A&s",
         "Lip Gloss",
         "Moisturizing Lip Gloss",
         33),
     ProductItemModel("https://m.media-amazon.com/images/I/61KMb6HGVVL.jpg", " Moisturising Lip Balm", "Moisturising Lip Balm For A Sheer Tint Of Colour", 10)
   ];
  static List<ProductItemModel>  skinProductsList=[
    ProductItemModel("https://media.zid.store/thumbs/4486e796-3377-4ce2-99c5-678b380f0cf7/f52bfdaf-47d7-4c21-a258-13f72da662c8-thumbnail-500x500-70.webp", "SHEGLAM  Boost Concealer", "", 40),
    ProductItemModel("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLD_g-sDzQGMlIYCraJxTkQhfos4sWr8NhDQ&s", "sheglam liquid blush", " SHEGLAM Color Bloom Dayglow Liquid Blush Shimmer Finish",20),
  ];
   
 }