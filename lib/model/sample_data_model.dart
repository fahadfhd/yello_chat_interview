

class SampleDataModel {
  String? status;
  Data? data;

  SampleDataModel({this.status, this.data});

  SampleDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  
}

class Data {
  String? title;
  String? itemTitle;
  List<Items>? items;

  Data({this.title, this.itemTitle, this.items});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    itemTitle = json['itemTitle'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
     
    }
  }


}

class Items {
  String? displayText;
  String? image;
  int? displayOrder;
  int? count;
  bool? isActive;
  String? id;
  List<Itemss>? items;

  Items(
      {this.displayText,
      this.image,
      this.displayOrder,
      this.count,
      this.isActive,
      this.id,
      this.items});

  Items.fromJson(Map<String, dynamic> json) {
    displayText = json['displayText'];
    image = json['image'];
    displayOrder = json['displayOrder'];
    count = json['count'];
    isActive = json['isActive'];
    id = json['id'];
    if (json['items'] != null) {
      items = <Itemss>[];
      json['items'].forEach((v) {
        items!.add(Itemss.fromJson(v));
      });
       items!.sort((a, b) {
        return a.sort!.compareTo(b.sort!);
      },);
    }
  }

  
}

class Itemss {
  int? unitPrice;
  String? itemName;
  String? subTitle;
  String? unitOfMeasure;
  int? minutes;
  String? id;
  int? sort;
  bool? isPrefer;

  Itemss(
      {this.unitPrice,
      this.itemName,
      this.subTitle,
      this.unitOfMeasure,
      this.minutes,
      this.id,
      this.sort,
      this.isPrefer});

  Itemss.fromJson(Map<String, dynamic> json) {
    unitPrice = json['unitPrice'];
    itemName = json['itemName'];
    subTitle = json['subTitle'];
    unitOfMeasure = json['unitOfMeasure'];
    minutes = json['minutes'];
    id = json['id'];
    sort = json['sort'];
    isPrefer = json['isPrefer'];
  }

 
}