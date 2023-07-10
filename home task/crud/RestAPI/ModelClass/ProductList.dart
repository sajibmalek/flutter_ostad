class ProductList{

  final String id,ProductName,ProductCode,Img,UnitPrice,Qty,TotalPrice;

  ProductList(this.id, this.ProductName, this.ProductCode, this.Img, this.UnitPrice, this.Qty, this.TotalPrice);

factory ProductList.toJson(Map<String,dynamic> value){
  return ProductList(
    value['_id'],
    value["ProductName"],
    value["ProductCode"],
    value["Img"],
    value["UnitPrice"],
    value["TotalPrice"],
    value["Qty"],
  );
}


}