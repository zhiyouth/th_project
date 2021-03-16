class ReduxState {
  bool isDark;
  String name;
  ReduxState({this.isDark = false, this.name = '唐浩'});
  setState(arguments) {
    if (arguments["isDark"] != null) {
      this.isDark = arguments["isDark"];
    }
  }
}
