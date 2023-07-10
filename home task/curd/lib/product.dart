class Product{
  final String id,productName,productCode,image,unitPrice,totalPrice, createDate,qty;

  Product(this.id, this.productName, this.productCode, this.image, this.unitPrice, this.totalPrice, this.createDate, this.qty);

  factory Product.toJson(Map<String,dynamic> value){
return Product(
  value['_id'],
  value["ProductName"],
  value["ProductCode"],
  value["Img"],
  value["UnitPrice"],
  value["TotalPrice"],
  value["CreatedDate"],
  value["Qty"],
);
  }
}