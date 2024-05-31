enum NativeChannels {
  showNativeDialog('show_native_dialog'),
  mainChannel('{{project_name.snakeCase()}}_main_channel');

  final String value;
  const NativeChannels(this.value);
}
