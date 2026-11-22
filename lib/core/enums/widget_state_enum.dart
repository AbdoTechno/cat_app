enum WidgetStateEnum {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == WidgetStateEnum.initial;
  bool get isLoading => this == WidgetStateEnum.loading;
  bool get isSuccess => this == WidgetStateEnum.success;
  bool get isFailure => this == WidgetStateEnum.failure;
}
