model LoginParam {
    grant_type?: string | null = "password";
    username?: string | null = "admin@admin";
    password?: string | null = "2mUNAWjgx1mL8Pd3uu0Q";
    refresh_token?: string | null;
}

model JsonWebToken {
    token?: string | null;
    expires: int64 = 0;
    expires_in: int64 = 0;
    refresh_token?: string | null;
    user_id?: string | null;
    display_name?: string | null;
    mustChangePassword: boolean;
}
