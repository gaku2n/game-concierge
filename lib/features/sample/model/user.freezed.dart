// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

 int get id; String get name; String get username; String get email; Address get address; String get phone; String get website; Company get company;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.website, website) || other.website == website)&&(identical(other.company, company) || other.company == company));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,username,email,address,phone,website,company);

@override
String toString() {
  return 'User(id: $id, name: $name, username: $username, email: $email, address: $address, phone: $phone, website: $website, company: $company)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 int id, String name, String username, String email, Address address, String phone, String website, Company company
});


$AddressCopyWith<$Res> get address;$CompanyCopyWith<$Res> get company;

}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? username = null,Object? email = null,Object? address = null,Object? phone = null,Object? website = null,Object? company = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as Address,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,website: null == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as Company,
  ));
}
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res> get address {
  
  return $AddressCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanyCopyWith<$Res> get company {
  
  return $CompanyCopyWith<$Res>(_self.company, (value) {
    return _then(_self.copyWith(company: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({required this.id, required this.name, required this.username, required this.email, required this.address, required this.phone, required this.website, required this.company});
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  int id;
@override final  String name;
@override final  String username;
@override final  String email;
@override final  Address address;
@override final  String phone;
@override final  String website;
@override final  Company company;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.website, website) || other.website == website)&&(identical(other.company, company) || other.company == company));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,username,email,address,phone,website,company);

@override
String toString() {
  return 'User(id: $id, name: $name, username: $username, email: $email, address: $address, phone: $phone, website: $website, company: $company)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String username, String email, Address address, String phone, String website, Company company
});


@override $AddressCopyWith<$Res> get address;@override $CompanyCopyWith<$Res> get company;

}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? username = null,Object? email = null,Object? address = null,Object? phone = null,Object? website = null,Object? company = null,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as Address,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,website: null == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as Company,
  ));
}

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res> get address {
  
  return $AddressCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanyCopyWith<$Res> get company {
  
  return $CompanyCopyWith<$Res>(_self.company, (value) {
    return _then(_self.copyWith(company: value));
  });
}
}


/// @nodoc
mixin _$Address {

 String get street; String get suite; String get city; String get zipcode; Geo get geo;
/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressCopyWith<Address> get copyWith => _$AddressCopyWithImpl<Address>(this as Address, _$identity);

  /// Serializes this Address to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Address&&(identical(other.street, street) || other.street == street)&&(identical(other.suite, suite) || other.suite == suite)&&(identical(other.city, city) || other.city == city)&&(identical(other.zipcode, zipcode) || other.zipcode == zipcode)&&(identical(other.geo, geo) || other.geo == geo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,street,suite,city,zipcode,geo);

@override
String toString() {
  return 'Address(street: $street, suite: $suite, city: $city, zipcode: $zipcode, geo: $geo)';
}


}

/// @nodoc
abstract mixin class $AddressCopyWith<$Res>  {
  factory $AddressCopyWith(Address value, $Res Function(Address) _then) = _$AddressCopyWithImpl;
@useResult
$Res call({
 String street, String suite, String city, String zipcode, Geo geo
});


$GeoCopyWith<$Res> get geo;

}
/// @nodoc
class _$AddressCopyWithImpl<$Res>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._self, this._then);

  final Address _self;
  final $Res Function(Address) _then;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? street = null,Object? suite = null,Object? city = null,Object? zipcode = null,Object? geo = null,}) {
  return _then(_self.copyWith(
street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,suite: null == suite ? _self.suite : suite // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,zipcode: null == zipcode ? _self.zipcode : zipcode // ignore: cast_nullable_to_non_nullable
as String,geo: null == geo ? _self.geo : geo // ignore: cast_nullable_to_non_nullable
as Geo,
  ));
}
/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoCopyWith<$Res> get geo {
  
  return $GeoCopyWith<$Res>(_self.geo, (value) {
    return _then(_self.copyWith(geo: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Address implements Address {
  const _Address({required this.street, required this.suite, required this.city, required this.zipcode, required this.geo});
  factory _Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

@override final  String street;
@override final  String suite;
@override final  String city;
@override final  String zipcode;
@override final  Geo geo;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressCopyWith<_Address> get copyWith => __$AddressCopyWithImpl<_Address>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Address&&(identical(other.street, street) || other.street == street)&&(identical(other.suite, suite) || other.suite == suite)&&(identical(other.city, city) || other.city == city)&&(identical(other.zipcode, zipcode) || other.zipcode == zipcode)&&(identical(other.geo, geo) || other.geo == geo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,street,suite,city,zipcode,geo);

@override
String toString() {
  return 'Address(street: $street, suite: $suite, city: $city, zipcode: $zipcode, geo: $geo)';
}


}

/// @nodoc
abstract mixin class _$AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$AddressCopyWith(_Address value, $Res Function(_Address) _then) = __$AddressCopyWithImpl;
@override @useResult
$Res call({
 String street, String suite, String city, String zipcode, Geo geo
});


@override $GeoCopyWith<$Res> get geo;

}
/// @nodoc
class __$AddressCopyWithImpl<$Res>
    implements _$AddressCopyWith<$Res> {
  __$AddressCopyWithImpl(this._self, this._then);

  final _Address _self;
  final $Res Function(_Address) _then;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? street = null,Object? suite = null,Object? city = null,Object? zipcode = null,Object? geo = null,}) {
  return _then(_Address(
street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,suite: null == suite ? _self.suite : suite // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,zipcode: null == zipcode ? _self.zipcode : zipcode // ignore: cast_nullable_to_non_nullable
as String,geo: null == geo ? _self.geo : geo // ignore: cast_nullable_to_non_nullable
as Geo,
  ));
}

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoCopyWith<$Res> get geo {
  
  return $GeoCopyWith<$Res>(_self.geo, (value) {
    return _then(_self.copyWith(geo: value));
  });
}
}


/// @nodoc
mixin _$Geo {

 String get lat; String get lng;
/// Create a copy of Geo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeoCopyWith<Geo> get copyWith => _$GeoCopyWithImpl<Geo>(this as Geo, _$identity);

  /// Serializes this Geo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Geo&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng);

@override
String toString() {
  return 'Geo(lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class $GeoCopyWith<$Res>  {
  factory $GeoCopyWith(Geo value, $Res Function(Geo) _then) = _$GeoCopyWithImpl;
@useResult
$Res call({
 String lat, String lng
});




}
/// @nodoc
class _$GeoCopyWithImpl<$Res>
    implements $GeoCopyWith<$Res> {
  _$GeoCopyWithImpl(this._self, this._then);

  final Geo _self;
  final $Res Function(Geo) _then;

/// Create a copy of Geo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lat = null,Object? lng = null,}) {
  return _then(_self.copyWith(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as String,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Geo implements Geo {
  const _Geo({required this.lat, required this.lng});
  factory _Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);

@override final  String lat;
@override final  String lng;

/// Create a copy of Geo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeoCopyWith<_Geo> get copyWith => __$GeoCopyWithImpl<_Geo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Geo&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng);

@override
String toString() {
  return 'Geo(lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class _$GeoCopyWith<$Res> implements $GeoCopyWith<$Res> {
  factory _$GeoCopyWith(_Geo value, $Res Function(_Geo) _then) = __$GeoCopyWithImpl;
@override @useResult
$Res call({
 String lat, String lng
});




}
/// @nodoc
class __$GeoCopyWithImpl<$Res>
    implements _$GeoCopyWith<$Res> {
  __$GeoCopyWithImpl(this._self, this._then);

  final _Geo _self;
  final $Res Function(_Geo) _then;

/// Create a copy of Geo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lat = null,Object? lng = null,}) {
  return _then(_Geo(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as String,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Company {

 String get name; String get catchPhrase; String get bs;
/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyCopyWith<Company> get copyWith => _$CompanyCopyWithImpl<Company>(this as Company, _$identity);

  /// Serializes this Company to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Company&&(identical(other.name, name) || other.name == name)&&(identical(other.catchPhrase, catchPhrase) || other.catchPhrase == catchPhrase)&&(identical(other.bs, bs) || other.bs == bs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,catchPhrase,bs);

@override
String toString() {
  return 'Company(name: $name, catchPhrase: $catchPhrase, bs: $bs)';
}


}

/// @nodoc
abstract mixin class $CompanyCopyWith<$Res>  {
  factory $CompanyCopyWith(Company value, $Res Function(Company) _then) = _$CompanyCopyWithImpl;
@useResult
$Res call({
 String name, String catchPhrase, String bs
});




}
/// @nodoc
class _$CompanyCopyWithImpl<$Res>
    implements $CompanyCopyWith<$Res> {
  _$CompanyCopyWithImpl(this._self, this._then);

  final Company _self;
  final $Res Function(Company) _then;

/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? catchPhrase = null,Object? bs = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,catchPhrase: null == catchPhrase ? _self.catchPhrase : catchPhrase // ignore: cast_nullable_to_non_nullable
as String,bs: null == bs ? _self.bs : bs // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Company implements Company {
  const _Company({required this.name, required this.catchPhrase, required this.bs});
  factory _Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

@override final  String name;
@override final  String catchPhrase;
@override final  String bs;

/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyCopyWith<_Company> get copyWith => __$CompanyCopyWithImpl<_Company>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Company&&(identical(other.name, name) || other.name == name)&&(identical(other.catchPhrase, catchPhrase) || other.catchPhrase == catchPhrase)&&(identical(other.bs, bs) || other.bs == bs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,catchPhrase,bs);

@override
String toString() {
  return 'Company(name: $name, catchPhrase: $catchPhrase, bs: $bs)';
}


}

/// @nodoc
abstract mixin class _$CompanyCopyWith<$Res> implements $CompanyCopyWith<$Res> {
  factory _$CompanyCopyWith(_Company value, $Res Function(_Company) _then) = __$CompanyCopyWithImpl;
@override @useResult
$Res call({
 String name, String catchPhrase, String bs
});




}
/// @nodoc
class __$CompanyCopyWithImpl<$Res>
    implements _$CompanyCopyWith<$Res> {
  __$CompanyCopyWithImpl(this._self, this._then);

  final _Company _self;
  final $Res Function(_Company) _then;

/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? catchPhrase = null,Object? bs = null,}) {
  return _then(_Company(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,catchPhrase: null == catchPhrase ? _self.catchPhrase : catchPhrase // ignore: cast_nullable_to_non_nullable
as String,bs: null == bs ? _self.bs : bs // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
