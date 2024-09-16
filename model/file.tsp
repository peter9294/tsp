model FileDTO {
    @doc("ID ของไฟล์ (*Require ตอน Save)")
    @format("uuid")
    id?: string | null;

    @doc("Url ของไฟล์")
    url?: string | null;

    @doc("ชื่อไฟล์ (ที่เก็บบน DB)")
    name?: string | null;

    @doc("ระบุว่าไฟล์อยู่ใน temp bucket")
    isTemp: boolean;

    @doc("Rotate")
    rotate?: int32 | null;

    @doc("")
    fileSize?: int64 | null;
}
