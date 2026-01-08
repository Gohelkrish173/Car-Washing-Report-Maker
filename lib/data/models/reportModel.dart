class ReportModel{
  int? Report_Id;
  String Report_Name;
  int? IsActive;
  String? Created_Date;
  String? Modifier_Date;

  ReportModel({
    this.Report_Id,
    required this.Report_Name,
    this.IsActive,
    this.Created_Date,
    this.Modifier_Date
  });

  factory ReportModel.fromMap(Map<String,dynamic> json){
    return ReportModel(
        Report_Id: json['Report_Id'],
        Report_Name: json['Report_Name'],
        IsActive: json['IsActive'],
        Created_Date: json['Created_Date'],
        Modifier_Date: json['Modified_Date']
    );
  }

  Map<String,dynamic> toMap(){
    return {
      'Report_Id' : this.Report_Id,
      'Report_Name' : this.Report_Name,
      'IsActive' : this.IsActive,
      'Created_Date' : this.Created_Date,
      'Modified_Date' : this.Modifier_Date
    };
  }

  static List<ReportModel> listReportModels(List<dynamic> mapList){
    return mapList.map((json)=>ReportModel.fromMap(json)).toList();
  }

  ReportModel copyWith({
    int? Report_Id,
    String? Report_Name,
    int? IsActive,
    String? Created_Date,
    String? Modified_Date
  }){
    return ReportModel(
      Report_Id: Report_Id ?? this.Report_Id,
      Report_Name: Report_Name ?? this.Report_Name,
      IsActive: IsActive ?? this.IsActive,
      Created_Date: Created_Date ?? this.Created_Date,
      Modifier_Date: Modified_Date ?? this.Modifier_Date
    );
  }

}