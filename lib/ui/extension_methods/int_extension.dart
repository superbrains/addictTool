extension IntX on int? {
  String pluralize(String singular, String plural) {
    if (this == null) return '';
    if (this! < 2) return '$this $singular';
    return '$this $plural';
  }

  String get formatMinTime {
    if (this == null) return '';
    if (this! < 60) return '${pluralize('Min', 'Mins')} ';
    if (this! == 60) return '1 hr';
    final hour = this! ~/ 60;
    final min = this! % 60;
    return '${hour.pluralize('hr', 'hrs')} ${min.pluralize('min', 'mins')}';
  }
}
