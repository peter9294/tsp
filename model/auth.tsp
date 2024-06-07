namespace Auth;

model LoginParam {
    grant_type: string = "password";
    username: string = "admin@admin";
    password: string = "2mUNAWjgx1mL8Pd3uu0Q";
    refresh_token: string;
}

model JsonWebToken {
    token: string;
    expires: int64 = 0;
    expires_in: int64 = 0;
    refresh_token: string;
    user_id: string;
    display_name: string;
    mustChangePassword: boolean;
}
