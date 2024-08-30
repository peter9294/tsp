enum Priority {
    LOW: "Low",
    MEDIUM: "Medium",
    HIGH: "High",
}

model CompanyDTO {
    id?: string | null;
    name?: string | null;
}

model TagDTO {
    id?: string | null;
    name?: string | null;
}

model ProjectDTO {
    ...Base;
    projectName?: string | null;
    memberNo?: int32 | null;
    telegramId?: string | null;
    clientCompany?: CompanyDTO;
    projectOwner?: UserDTO;
    priority?: Priority;
    startDate?: utcDateTime | null;
    tag?: TagDTO[] | null;
    remark?: string | null;
    members?: UserDTO[];
    isActive?: boolean | null;
}

model ProjectNameDTO {
    projectId: ProjectDTO.id;
    projectName: ProjectDTO.projectName;
}
