@error
model ErrorResponse {
    popupErrors?: ErrorItem[];
    fieldErrors?: ErrorItem[];
}

model ErrorItem {
    code?: string;
    message?: string;
}
