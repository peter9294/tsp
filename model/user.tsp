// enum Role {
//     SUPER_ADMIN: "SuperAdmin",
//     HEAD_OF_TEAM: "HeadOfTeam",
//     OFFICER: "Officer",
//     EMPLOYEE: "Employee",
// }

enum NameTitleEN {
    MR: "Mr",
    MRS: "Mrs",
    MS: "Ms",
}

@doc("แผนก")
enum Department {
    BA: "BA",
    BACKEND: "Backend",
    FRONTEND: "Frontend",
    QA: "QA",
    UXUI: "UX/UI",
    TESTER: "Tester",
    ADMIN: "Admin",
}

enum Sex {
    MALE: "Male",
    FEMALE: "Female",
}

// TODO: add gender
enum Gender {
    STRAIGHT_MALE: "StraightMale",
    STRAIGHT_FEMALE: "StraightFeMale",
}

enum GetUserListSortBy {
    nameTitleTH: "NameTitleTH",
    firstNameTH: "FirstNameTH",
    lastNameTH: "LastNameTH",
    nameTitleEN: "NameTitleEN",
    firstNameEN: "FirstNameEN",
    lastNameEN: "LastNameEN",
    email: "Email",
    mobile: "Mobile",
    address: "Address",
    department: "Department",
    position: "Position",
    startWorkDate: "StartWorkDate",
    role: "Role",
}

alias PrivateProperties = "citizenId" | "address" | "birthDate";

model UserDTO {
    ...Base;
    nameTitleTH?: string | null;
    firstNameTH?: string | null;
    lastNameTH?: string | null;
    nameTitleEN?: NameTitleEN;
    firstNameEN?: string | null;
    lastNameEN?: string | null;
    email?: string | null;
    mobile?: int32 | null;
    sex?: Sex;
    gender?: Gender;
    citizenId?: string | null;
    address?: string | null;
    birthDate?: utcDateTime | null;
    profilePicture?: FileDTO;
    ...WorkDetailDTO;
}

model WorkDetailDTO {
    employeeId?: string | null;
    department?: Department;

    @doc("ตำแหน่ง")
    position?: string | null;

    startWorkDate?: utcDateTime | null;
    role?: RoleDTO;
    isActive?: boolean | null;
}

@withoutOmittedProperties(
    PrivateProperties | "employeeId" | "isActive" | "sex" | "gender"
)
model UserListDTO {
    ...UserDTO;
}

model UserInfoDTO {
    id?: UserDTO.id;
    nameTitleTH?: UserDTO.nameTitleTH;
    firstNameTH?: UserDTO.firstNameTH;
    lastNameTH?: UserDTO.lastNameTH;
    nameTitleEN?: UserDTO.nameTitleEN;
    firstNameEN?: UserDTO.firstNameEN;
    lastNameEN?: UserDTO.lastNameEN;
    email?: UserDTO.email;
    mobile?: UserDTO.mobile;
    department?: UserDTO.department;
    position?: UserDTO.position;
    profilePicture?: UserDTO.profilePicture;
}

model UserRequestDTO {
    id?: UserDTO.id;
    firstNameTH?: UserDTO.firstNameTH;
    lastNameTH?: UserDTO.lastNameTH;
    position?: UserDTO.position;
}
