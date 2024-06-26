class _LocalizationUtils {
  Map<String, dynamic> _staticLocalizedValues = {};

  static final _LocalizationUtils _translations =
      _LocalizationUtils._internal();
  factory _LocalizationUtils() {
    return _translations;
  }
  _LocalizationUtils._internal();

  void setStaticLocalizedValues(Map<String, dynamic> localizedValues) {
    _staticLocalizedValues = localizedValues;
  }

  ///
  /// Return the translation that corresponds to the [key]
  ///
  String textStatic(String key, {Map<String, String>? params}) {
    late String value;

    // Get the translated string
    value = _getStaticLocalizedValue(key, _staticLocalizedValues);
  
    if (params != null) {
      /// If parametes is not null then replace all these params in the string
      value = _mapParamsToTranslatedString(value, params);
    }
    return value;
  }

  String _getStaticLocalizedValue(key, Map<String, dynamic> values) {
    if (values[key] != null && values[key] != '') {
      return values[key];
    }

    return key;
  }

  String _mapParamsToTranslatedString(
    String value,
    Map<String, String> params,
  ) {
    params.forEach((key, value1) {
      value = value.replaceAll('{{$key}}', value1);
    });
    return value;
  }
}

_LocalizationUtils translations = _LocalizationUtils();
