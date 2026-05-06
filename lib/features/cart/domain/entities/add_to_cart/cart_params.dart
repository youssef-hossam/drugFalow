class CartParams {
  String? productItemId;
  dynamic quantity;

  CartParams({this.productItemId, this.quantity});


  Map<String,dynamic>toMap(){
    return {
      "product_id" : productItemId,
      "quantity" : quantity
    };
  }
}