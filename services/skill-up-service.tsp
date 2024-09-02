import "@typespec/http";

import "../model/main.tsp";

using Http;

namespace SofteverHR.Services;

@tag("SkillUp")
@route("/api/SkillUp")
interface SkillUp {
    @get
    @route("/List")
    GetSkillUpList(
        @query month?: string,
        @query department?: Department,
        ...TableQuery<GetSkillUpListSortBy>,
    ): TableResponse<SkillUpListDTO[]>;

    @post
    PostSkillUp is PostBody<SkillUpListDTO>;

    @put
    PutSkillUp is PutId<SkillUpListDTO>;

    @delete
    DeleteSkillUp is DeleteId;

    @get
    @route("/Request")
    GetSkillUpRequest(
        @query userId?: string,
        @query searchTerm?: string,
        @query year?: string,
        @query department?: Department,
        ...TableQuery<GetSkillUpRequestSortBy>,
    ): TableResponse<SkillUpRequestDTO[]>;

    @put
    @route("/Request")
    PutSkillUpRequest is PutId<SkillUpRequestDTO>;

    @post
    @route("/Request/MultipleApprove")
    PostSkillUpRequestMultipleApprove is PostBody<ApproveDTO[]>;

    @post
    @route("/Request/MultipleDecline")
    PostSkillUpRequestMultipleDecline is PostBody<ApproveDTO[]>;

    @get
    @route("/CourseDropdown")
    GetSkillUpCourseDropdown(
        @query department?: Department,
    ): NormalResponse<SkillUpCourseDTO[]>;
}
