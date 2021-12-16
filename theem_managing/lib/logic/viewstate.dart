class ThemeManageViewState{
  final String themeName;
  final bool loading;
  final String error;

  ThemeManageViewState({
    required this.themeName,
    required this.loading,
    required this.error});

  factory ThemeManageViewState.init(){
    return ThemeManageViewState(themeName: "", loading: false, error: "");
  }


  ThemeManageViewState copy({
    String? themeName,
    bool? loading,
    String? error
  }){
      return ThemeManageViewState(
          themeName: themeName ?? this.themeName,
          loading: loading ?? this.loading,
          error: error ?? this.error
      );
  }


}