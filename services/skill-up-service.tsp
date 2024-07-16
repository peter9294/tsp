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
        ...SortBy<GetSkillUpListSortBy>,
        ...Paging<void>,
    ): Success<SkillUpListDTO[]> | Error;

    @post
    PostSkillUp(@body body: SkillUpListDTO): void | Error;

    @put
    PutSkillUp(
        @format("uuid")
        @path
        id: string,

        @body body: SkillUpListDTO,
    ): void | Error;

    @delete
    DeleteSkillUp(
        @format("uuid")
        @path
        id: string,
    ): void | Error;

    @get
    @route("/Request")
    GetSkillUpRequest(
        @query searchTerm?: string,
        @query year?: string,
        @query department?: Department,
        ...SortBy<GetSkillUpRequestSortBy>,
        ...Paging<void>,
    ): Success<SkillUpRequestDTO[]> | Error;

    @put
    @route("/Request")
    PutSkillUpRequest(
        @format("uuid")
        @path
        id: string,

        @body body: SkillUpRequestDTO,
    ): void | Error;

    @post
    @route("/Request/MultipleApprove")
    PostSkillUpRequestMultipleApprove(@body body: ApproveDTO[]): void | Error;

    @post
    @route("/Request/MultipleDecline")
    PostSkillUpRequestMultipleDecline(@body body: ApproveDTO[]): void | Error;

    @get
    @route("/CourseDropdown")
    GetSkillUpCourseDropdown(
        @query department?: Department,
    ): Success<SkillUpCourseDTO[]> | Error;
}
