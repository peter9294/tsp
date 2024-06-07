namespace CustomError;

@error
model ErrorReponse {
    popupErrors: ErrorItem[];
    fieldErrors: ErrorItem[];
}

model ErrorItem {
    code: string;
    message: string;
}
