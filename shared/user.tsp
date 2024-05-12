namespace User;

enum Role {
    SUPER_ADMIN: "SuperAdmin",
    ADMIN: "Admin",
    USER: "User",
}

model UserDTO {
    id?: string;
    display?: string;
    created?: utcDateTime;
    role?: Role;
}
