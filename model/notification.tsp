enum NotificationStatus {
    READ: "Read",
    UN_READ: "UnRead",
}

enum NotificationType {
    ADMIN: "Admin",
    GENERAL: "General",
    LEAVE: "Leave",
    LIFESTYLE_WALLET: "LifestyleWallet",
    PAYMENT: "Payment",
    PERMISSION: "Permission",
    PROJECT: "Project",
    REPORT: "Report",
    SKILL_UP: "SkillUp",
    SOFTEVER_FIT: "SofteverFit",
    USER: "User",
}

model NotificationDTO {
    ...Base;
    notificationType?: NotificationType;
    message?: string | null;
    isRead?: boolean | null;
}

model TotalNotificationDTO {
    all?: int32 | null;
    read?: int32 | null;
    unRead?: int32 | null;
}
