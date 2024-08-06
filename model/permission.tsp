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
