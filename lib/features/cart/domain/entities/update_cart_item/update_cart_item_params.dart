class UpdateCartItemParams {
  dynamic cartItemId;
  dynamic quantity;

  UpdateCartItemParams({this.cartItemId, this.quantity});

  Map<String,dynamic>toMap(){
    return {
      "quantity" : quantity
    };
  }
}