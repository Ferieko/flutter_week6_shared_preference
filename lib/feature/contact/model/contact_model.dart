class ContactModel {
  ContactModel({
    required this.data,
});
  List<DataContact>data;

  factory ContactModel.fromJson(Map<String,dynamic> json)=>ContactModel(
      data:List<DataContact>.from(
        json["data"].map((x)=>DataContact.fromJson(x))
      ) ,
  );
  Map<String,dynamic> toJson()=>{
    "data":List<dynamic>.from(data.map((x) => x.toJson())),
  };

}

class DataContact {
  DataContact({
    required this.nama,
    required this.nomorTelepon,
});
  String nama;
  String nomorTelepon;
  factory DataContact.fromJson(Map<String,dynamic> json)=> DataContact(
    nama: json["nama"],
    nomorTelepon: json["nomorTelepon"],
  );
  Map<String,dynamic> toJson()=>{
    "nama": nama,
    "nomorTelepon": nomorTelepon,
  };
}
