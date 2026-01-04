class ReportModel{
  int? Report_Id;
  String Report_Name;
  bool IsActive;

  ReportModel({
    this.Report_Id,
    required this.Report_Name,
    required this.IsActive
  });

  factory ReportModel.fromMap(Map<String,dynamic> json){
    return ReportModel(
        Report_Id: json['Report_Id'],
        Report_Name: json['Report_Name'],
        IsActive: json['IsActive']
    );
  }

  Map<String,dynamic> toMap(){
    return {
      'Report_Id' : this.Report_Id,
      'Report_Name' : this.Report_Name,
      'IsActive' : this.IsActive
    };
  }

  static List<ReportModel> listReportModels(List<dynamic> mapList){
    return mapList.map((json)=>ReportModel.fromMap(json)).toList();
  }

  ReportModel copyWith({
    int? Report_Id,
    String? Report_Name,
    bool? IsActive
  }){
    return ReportModel(
      Report_Id: Report_Id ?? this.Report_Id,
      Report_Name: Report_Name ?? this.Report_Name,
      IsActive: IsActive ?? this.IsActive
    );
  }

}