enum GetUserManagementUsersListSortBy {
    NAME_TITLE_TH: "NameTitleTH",
    FIRST_NAME_TH: "FirstNameTH",
    LAST_NAME_TH: "LastNameTH",
    NAME_TITLE_EN: "NameTitleEN",
    FIRST_NAME_EN: "FirstNameEN",
    LAST_NAME_EN: "LastNameEN",
    EMAIL: "Email",
    MOBILE: "Mobile",
    SEX: "Sex",
    GENDER: "Gender",
    CITIZEN_ID: "CitizenId",
    ADDRESS: "Address",
    BIRTH_DATE: "BirthDate",
    EMPLOYEE_ID: "EmployeeId",
    DEPARTMENT: "Department",
    POSITION: "Position",
    START_WORK_DATE: "StartWorkDate",
    ROLE: "Role",
    IS_ACTIVE: "IsActive",
}

model UserManagementUserDTO {
    ...UserDTO;
    ...BaseTablePermission;
}
