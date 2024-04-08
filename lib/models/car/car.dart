class Car {
  String? _searchKey;
  final int? _idVehicle;
  final String? _model;
  final String? _group;
  final String? _urlImageVehicle;
  final double? _price;
  final int? _seats;
  final int? _doors;
  final bool? _isAutomatic;
  final int? _baggage;
  final String? _nameSupplier;
  final String? _adresseSupplier;
  final String? _urlImageSupplier;
  final _ratings;

  // Constructor for creating a new Car object
  Car({
    String? searchKey,
    int? idVehicle,
    String? model,
    String? group,
    String? urlImageVehicle,
    double? price,
    int? seats,
    int? doors,
    bool? isAutomatic,
    int? baggage,
    String? nameSupplier,
    String? adresseSupplier,
    String? urlImageSupplier,
    var ratings,
  })  : _searchKey = searchKey,
        _idVehicle = idVehicle,
        _model = model,
        _group = group,
        _urlImageVehicle = urlImageVehicle,
        _price = price,
        _seats = seats,
        _doors = doors,
        _isAutomatic = isAutomatic,
        _baggage = baggage,
        _nameSupplier = nameSupplier,
        _adresseSupplier = adresseSupplier,
        _urlImageSupplier = urlImageSupplier,
        _ratings = ratings;

  // Getters for the properties
  String? get searchKey => _searchKey;
  set searchKey(String? searchKey) => _searchKey = searchKey;
  int? get idVehicle => _idVehicle;
  String? get model => _model;
  String? get group => _group;
  String? get urlImageVehicle => _urlImageVehicle;
  double? get price => _price;
  int? get seats => _seats;
  int? get doors => _doors;
  bool? get isAutomatic => _isAutomatic;
  int? get baggage => _baggage;
  String? get nameSupplier => _nameSupplier;
  String? get adresseSupplier => _adresseSupplier;
  String? get urlImageSupplier => _urlImageSupplier;
  get ratings => _ratings;

  static Car fromJson(Map<String, dynamic> json) {
    return Car(
      idVehicle: int.tryParse(json['vehicle_info']['v_id']),
      model: json['vehicle_info']['v_name'],
      group: json['vehicle_info']['group'],
      urlImageVehicle: json['vehicle_info']['image_url'],
      price: json['pricing_info']['price'],
      seats: int.tryParse(json['vehicle_info']['seats']),
      doors: int.tryParse(json['vehicle_info']['doors']),
      isAutomatic: json['vehicle_info']['transmission'] == 'automatique',
      baggage: int.tryParse(json['vehicle_info']['suitcases']['small']),
      nameSupplier: json['supplier_info']['name'],
      adresseSupplier: json['supplier_info']['address'],
      urlImageSupplier: json['supplier_info']['logo_url'],
      ratings: json['rating_info']['average'],
    );
  }
}
