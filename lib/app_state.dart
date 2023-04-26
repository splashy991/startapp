import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _favourites = prefs
            .getStringList('ff_favourites')
            ?.map((path) => path.ref)
            .toList() ??
        _favourites;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<DocumentReference> _favourites = [];
  List<DocumentReference> get favourites => _favourites;
  set favourites(List<DocumentReference> _value) {
    _favourites = _value;
    prefs.setStringList('ff_favourites', _value.map((x) => x.path).toList());
  }

  void addToFavourites(DocumentReference _value) {
    _favourites.add(_value);
    prefs.setStringList(
        'ff_favourites', _favourites.map((x) => x.path).toList());
  }

  void removeFromFavourites(DocumentReference _value) {
    _favourites.remove(_value);
    prefs.setStringList(
        'ff_favourites', _favourites.map((x) => x.path).toList());
  }

  void removeAtIndexFromFavourites(int _index) {
    _favourites.removeAt(_index);
    prefs.setStringList(
        'ff_favourites', _favourites.map((x) => x.path).toList());
  }

  List<DocumentReference> _search = [];
  List<DocumentReference> get search => _search;
  set search(List<DocumentReference> _value) {
    _search = _value;
  }

  void addToSearch(DocumentReference _value) {
    _search.add(_value);
  }

  void removeFromSearch(DocumentReference _value) {
    _search.remove(_value);
  }

  void removeAtIndexFromSearch(int _index) {
    _search.removeAt(_index);
  }

  bool _searchlist = true;
  bool get searchlist => _searchlist;
  set searchlist(bool _value) {
    _searchlist = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
