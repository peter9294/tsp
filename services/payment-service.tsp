import "@typespec/http";

import "../model/main.tsp";

using Http;

namespace SofteverHR.Services;
@tag("Payment")
@route("/api/Payment")
interface Payment {
    @get
    @route("/List")
    GetPaymentList(
        ...TableQuery<GetPaymentListSortBy>,
    ): TableResponse<PaymentListDTO[]>;

    @post
    CreatePayment is PostBody<PaymentListDTO>;

    @put
    PutPayment is PutId<PaymentListDTO>;

    @delete
    DeletePayment is DeleteId;

    @get
    @route("/History")
    GetPaymentHistory(
        @query userId?: string,
        @query year?: string,
        @query searchTerm?: string,
        @query paymentType?: PaymentType,
        ...TableQuery<GetPaymentHistorySortBy>,
    ): TableResponse<PaymentRequestHistoryDTO[]>;

    @get
    @route("/Request")
    GetPaymentRequest(
        @query year?: string,
        @query searchTerm?: string,
        @query leaveType?: PaymentType,
        ...TableQuery<GetPaymentRequestSortBy>,
    ): TableResponse<PaymentRequestHistoryDTO[]>;

    @put
    @route("/Request")
    PutPaymentRequest is PutId<PaymentRequestHistoryDTO>;

    @post
    @route("/Request/MultipleDelete")
    DeleteMultiplePaymentManagement(
        @body body: {
            @format("uuid") id: string;
        }[],
    ): VoidResponse;

    @post
    @route("/Request/MultipleApprove")
    PostPaymentRequestMultipleApprove is PostBody<ApproveDTO[]>;

    @post
    @route("/Request/MultipleDecline")
    PostPaymentRequestMultipleDecline is PostBody<ApproveDTO[]>;
}
