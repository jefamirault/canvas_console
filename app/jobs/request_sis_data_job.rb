class RequestSisDataJob < ApplicationJob
  queue_as :default

  include ExportHelper

  def perform(*args)
    courses_json = read_json 'sis_courses.json'
    Course.refresh_sis_courses courses_json

    rosters_json = read_json 'sis_section_rosters.json'
    emails_json = read_json 'email_list.json'
    # TODO: DEBUGGING
    # rosters_json = [
    #     {
    #         "type" => "section",
    #         "sis_section_id" => 0,
    #         "name" => "Sample Course",
    #         "sis_course_id" => 0,
    #         "starting_semester" => "2020 - 2021 2nd Semester",
    #         "roster" => [
    #             {
    #                 "type" => "teacher",
    #                 "sis_id" => 5091804,
    #                 "name" => "Jef Amirault"
    #             },
    #         ]
    #     }
    # ]
    # emails_json = [
    #     {
    #         "UserID" => 5091804,
    #         "EMail" => "jefamirault@burrburton.org"
    #     }
    # ]
    User.refresh_sis_users rosters_json, emails_json
    # binding.pry
    Section.refresh_sis_rosters rosters_json

  end
end
