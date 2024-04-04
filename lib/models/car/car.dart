class Car {
  final String _searchKey;
  final int _idVehicle;
  final String _model;
  final String _urlImageVehicle;
  final double _price;
  final int _seats;
  final int _doors;
  final bool _isAutomatic;
  final int _baggage;
  final String _nameSupplier;
  final String _adresseSupplier;
  final String _urlImageSupplier;
  final double _ratings;

  Car(
      this._searchKey,
      this._idVehicle,
      this._model,
      this._urlImageVehicle,
      this._price,
      this._seats,
      this._doors,
      this._isAutomatic,
      this._baggage,
      this._nameSupplier,
      this._adresseSupplier,
      this._urlImageSupplier,
      this._ratings);

  String get searchKey => _searchKey;
  int get idVehicle => _idVehicle;
  String get model => _model;
  String get urlImageVehicle => _urlImageVehicle;
  double get price => _price;
  int get seats => _seats;
  int get doors => _doors;
  bool get isAutomatic => _isAutomatic;
  int get baggage => _baggage;
  String get nameSupplier => _nameSupplier;
  String get adresseSupplier => _adresseSupplier;
  String get urlImageSupplier => _urlImageSupplier;
  double get ratings => _ratings;
}
