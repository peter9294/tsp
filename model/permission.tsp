enum GetPermissionUserRoleListSortBy {
    NAME: "Name",
    DEPARTMENT: "Department",
}

@doc("สิทธิ์ผู้ใช้งาน")
model RoleDTO {
    id?: string | null;
    roleName?: string | null;
}
model UserRoleListDTO {
    id?: UserDTO.id;
    firstNameTH?: UserDTO.firstNameTH;
    lastNameTH?: UserDTO.lastNameTH;
    department?: UserDTO.department;
    role?: UserDTO.role;
    canUpdateRole?: boolean | null;
}

model CanPermissionDTO {
    canView?: boolean | null;
    canEdit?: boolean | null;
    canDelete?: boolean | null;
    canCreate?: boolean | null;
    canApprove?: boolean | null;
}

model RolePermissionDTO {
    role?: RoleDTO;
    permission?: CanPermissionDTO;
}

model PermissionDTO {
    leave?: RolePermissionDTO[];
    advancePayment?: RolePermissionDTO[];
    softeverFit?: RolePermissionDTO[];
    lifestyleWallet?: RolePermissionDTO[];
    skillUp?: RolePermissionDTO[];
    userManagement?: RolePermissionDTO[];
    leaveManagement?: RolePermissionDTO[];
    projectManagement?: RolePermissionDTO[];
    permissionManagement?: RolePermissionDTO[];
}

model PermissionMenuDTO {
    canViewHome?: boolean | null;
    canViewLeaveHistory?: boolean | null;
    canViewLeaveManagement?: boolean | null;
    canViewLeaveRequest?: boolean | null;
    canViewLeaveTotal?: boolean | null;
    canViewPaymentHistory?: boolean | null;
    canViewPaymentList?: boolean | null;
    canViewPaymentRequest?: boolean | null;
    canViewReportOverall?: boolean | null;
    canViewReportEmployee?: boolean | null;
    canViewRolePermission?: boolean | null;
    canViewRoleUser?: boolean | null;
    canViewUserManagementProjectManagement?: boolean | null;
    canViewUserManagementUsersList?: boolean | null;
    canViewWelfareLifestyleWallet?: boolean | null;
    canViewWelfareRequestHistoryLifestyleWallet?: boolean | null;
    canViewWelfareRequestHistorySkillUp?: boolean | null;
    canViewWelfareRequestHistorySofteverFit?: boolean | null;
    canViewWelfareRequestLifestyleWallet?: boolean | null;
    canViewWelfareRequestSkillUp?: boolean | null;
    canViewWelfareRequestSofteverFit?: boolean | null;
    canViewWelfareSkillUp?: boolean | null;
    canViewWelfareSofteverFit?: boolean | null;
}
