class RD_Model{
  int? RD_Id;
  int Report_Id;
  String? Reg_No;
  int? JC_No;
  String? ModalName;
  String? Service;
  int? Washing;
  String? Technician_Name;
  String? Remark;
  String? Created_Date;
  String? Modified_Date;

  RD_Model({
    this.RD_Id,
    required this.Report_Id,
    this.Reg_No,
    this.JC_No,
    this.ModalName,
    this.Service,
    this.Washing,
    this.Technician_Name,
    this.Remark,
    this.Created_Date,
    this.Modified_Date
  });

  // Factory Constructor use for Create DirectMethod on Object
  factory RD_Model.fromMap(Map<String,dynamic> json){
    return RD_Model(
      RD_Id: json['RD_Id'],
      Reg_No: json['Reg_No'],
      Report_Id: json['Report_Id'],
      JC_No: json['JC_No'],
      ModalName: json['ModalName'],
      Service: json['Service'],
      Washing: json['Washing'],
      Technician_Name: json['Technician_Name'],
      Remark: json['Remark'],
      Created_Date: json['Created_Date'],
      Modified_Date: json['Modified_Date']
    );
  }

  Map<String,dynamic> toMap(){
    return{
      "RD_Id" : this.RD_Id,
      "Report_Id" : this.Report_Id,
      "Reg_No" : this.Reg_No,
      "JC_No" : this.JC_No,
      "ModalName" : this.ModalName,
      "Service" : this.Service,
      "Washing" : this.Washing,
      "Technician_Name" : this.Technician_Name,
      "Remark" : this.Remark,
      "Created_Date" : this.Created_Date,
      "Modified_Date" : this.Modified_Date,
    };
  }

  static List<RD_Model> listRDModels(List<dynamic> mapList){
    return mapList.map((m)=>RD_Model.fromMap(m)).toList();
  }

  // Object CopyMethod use for Update Properties
  RD_Model copyWith({
    int? RD_Id,
    int? Report_Id,
    String? Reg_No,
    int? JC_No,
    String? ModalName,
    String? Service,
    int? Washing,
    String? Technician_Name,
    String? Remark,
    String? Created_Date,
    String? Modified_Date
  }){
    return RD_Model(
      RD_Id: RD_Id ?? this.RD_Id,
      Reg_No: Reg_No ?? this.Reg_No,
      Report_Id: Report_Id ?? this.Report_Id,
      JC_No: JC_No ?? this.JC_No,
      ModalName: ModalName ?? this.ModalName,
      Service: Service ?? this.Service,
      Washing: Washing ?? this.Washing,
      Technician_Name: Technician_Name ?? this.Technician_Name,
      Remark: Remark ?? this.Remark,
      Created_Date: Created_Date ?? this.Created_Date,
      Modified_Date: Modified_Date ?? this.Modified_Date
    );
  }

}