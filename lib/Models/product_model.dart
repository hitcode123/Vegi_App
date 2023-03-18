class ProductModel {
  String? productId;
  String? productName;
  String? productImage;
  int? productPrice;
  int? productQuantity;

  ProductModel(
      {this.productId,
      this.productName,
      this.productImage,
      this.productPrice,
      this.productQuantity = 1});
}
