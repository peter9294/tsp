model BaseTablePermission {
    canView?: boolean | null;
    canEdit?: boolean | null;
    canDelete?: boolean | null;
}

model BaseApprovePermission {
    canApprove?: boolean | null;
    approveDate?: utcDateTime | null;
}
