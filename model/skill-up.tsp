enum GetSkillUpListSortBy {
    COURSE_NAME: "CourseName",
    COURSE_TEAM: "CourseTeam",
    LEARNING_STATUS: "LearningStatus",
    START_DATE: "StartDate",
    END_DATE: "EndDate",
    ATTACHMENT: "Attachment",
    REWARD: "Reward",
    REQUEST_STATUS: "RequestStatus",
}

enum GetSkillUpRequestSortBy {
    NAME: "Name",
    POSITION: "Position",
    ...GetSkillUpListSortBy,
}

enum LearningStatus {
    LEARNING: "Learning",
    COMPLETED: "Completed",
}

model SkillUpSummaryDTO {
    totalCourse?: int32 | null;
    totalReward?: int32 | null;
}

model SkillUp {
    course?: SkillUpCourseDTO | null;
    courseTeam?: Department;

    @format("url")
    url?: string | null;

    learningStatus?: LearningStatus;
    startDate?: utcDateTime | null;
    endDate?: utcDateTime | null;
    attachment?: FileDTO | null;
    reward?: int32 | null;
    requestStatus?: RequestStatus;
}

model SkillUpListDTO {
    ...Base;
    ...SkillUp;
    ...BaseTablePermission;
}

model SkillUpRequestDTO {
    ...Base;
    user?: {
        id?: UserDTO.id;
        firstNameTH?: UserDTO.firstNameTH;
        lastNameTH?: UserDTO.lastNameTH;
        position?: UserDTO.position;
    } | null;
    summary?: SkillUpSummaryDTO | null;
    ...SkillUp;
    ...BaseTablePermission;
    ...BaseApprovePermission;
}

model SkillUpCourseDTO {
    @format("uuid")
    id?: string | null;

    name?: string | null;
}
