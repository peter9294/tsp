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
    PostSkillUp(@body body: SkillUpListDTO): VoidResponse;

    @put
    PutSkillUp(
        @format("uuid")
        @path
        id: string,

        @body body: SkillUpListDTO,
    ): VoidResponse;

    @delete
    DeleteSkillUp is DeleteId;

    @get
    @route("/Request")
    GetSkillUpRequest(
        @query searchTerm?: string,
        @query year?: string,
        @query department?: Department,
        ...TableQuery<GetSkillUpRequestSortBy>,
    ): TableResponse<SkillUpRequestDTO[]>;

    @put
    @route("/Request")
    PutSkillUpRequest(
        @format("uuid")
        @path
        id: string,

        @body body: SkillUpRequestDTO,
    ): VoidResponse;

    @post
    @route("/Request/MultipleApprove")
    PostSkillUpRequestMultipleApprove(@body body: ApproveDTO[]): VoidResponse;

    @post
    @route("/Request/MultipleDecline")
    PostSkillUpRequestMultipleDecline(@body body: ApproveDTO[]): VoidResponse;

    @get
    @route("/CourseDropdown")
    GetSkillUpCourseDropdown(
        @query department?: Department,
    ): NormalResponse<SkillUpCourseDTO[]>;
}
