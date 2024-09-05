// //TODO
// class AddressModel {
//   int? addressId;
//   int? addressUsersid;
//   String? addressName;
//   String? addressCity;
//   String? addressStreet;
//   String? addressNote;
//   double? addressLong;
//   double? addressLat;

//   AddressModel(
//       {this.addressId,
//       this.addressUsersid,
//       this.addressName,
//       this.addressCity,
//       this.addressStreet,
//       this.addressNote,
//       this.addressLong,
//       this.addressLat});

//   AddressModel.fromJson(Map<String, dynamic> json) {
//     addressId = json['address_id'];
//     addressUsersid = json['address_usersid'];
//     addressName = json['address_name'];
//     addressCity = json['address_city'];
//     addressStreet = json['address_street'];
//     addressNote = json['address_note'];
//     addressLong = json['address_long'];
//     addressLat = json['address_lat'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['address_id'] = addressId;
//     data['address_usersid'] = addressUsersid;
//     data['address_name'] = addressName;
//     data['address_city'] = addressCity;
//     data['address_street'] = addressStreet;
//     data['address_note'] = addressNote;
//     data['address_long'] = addressLong;
//     data['address_lat'] = addressLat;
//     return data;
//   }
// }
