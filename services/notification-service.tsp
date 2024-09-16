import "@typespec/http";

import "../model/main.tsp";

using Http;

namespace SofteverHR.Services;

@tag("Notification")
@route("/api/Notification")
interface Notification {
    @get
    GetNotification(
        @query status?: NotificationStatus,
        ...Paging<void>,
    ): NormalResponse<NotificationDTO[]>;

    @get
    @route("/Total")
    GetNotificationTotal(): NormalResponse<TotalNotificationDTO>;

    @get
    @route("/Counter")
    GetNotificationCounter(): NormalResponse<{
        count?: numeric | null;
    }>;

    @post
    @route("/ReadAll")
    PostNotificationReadAll(): VoidResponse;

    @post
    @route("/DeleteAll")
    PostNotificationDeleteAll(): VoidResponse;

    @post
    @route("/MultipleRead")
    PostNotificationMultipleRead is PostBody<{
        @format("uuid") id: string;
    }[]>;

    @post
    @route("MultipleDelete")
    PostNotificationMultipleDelete is PostBody<{
        @format("uuid") id: string;
    }[]>;
}
