class ValidatorService {
  bool _isValidLatitude(String latitudeString) {
    final regex = RegExp(r'^[-+]?([1-8]?\d(\.\d+)?|90(\.0+)?)$');
    return regex.hasMatch(latitudeString);
  }

  bool _isValidLongitude(String longitudeString) {
    final regex = RegExp(r'^[-+]?((1[0-7]|[1-9])?\d(\.\d+)?|180(\.0+)?)$');
    return regex.hasMatch(longitudeString);
  }

  String? latitudeValidator(String? latitude) {
    if (latitude != null) {
      if (latitude.isEmpty) {
        return 'Введите широту';
      } else if (!_isValidLatitude(latitude)) {
        return 'Неверное значение долготы';
      }
    }
    return null;
  }

  String? longitudeValidator(String? longitude) {
    if (longitude != null) {
      if (longitude.isEmpty) {
        return 'Введите долготу';
      } else if (!_isValidLongitude(longitude)) {
        return 'Неверное значение долготы';
      }
    }
    return null;
  }
}
