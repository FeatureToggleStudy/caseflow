# frozen_string_literal: true

require "support/database_cleaner"
require "rails_helper"

describe MonthlyMetricsReportJob, :postgres do
  before do
    seven_am_random_date = Time.new(2019, 3, 29, 7, 0, 0).in_time_zone
    Timecop.freeze(seven_am_random_date)
  end

  let(:veteran) { create(:veteran) }

  let!(:hlrs) do
    create(:higher_level_review, veteran_file_number: veteran.file_number)
    create(:higher_level_review,
           establishment_submitted_at: 37.days.ago,
           establishment_last_submitted_at: 37.days.ago,
           veteran_file_number: veteran.file_number)
    create(:higher_level_review,
           establishment_submitted_at: 37.days.ago,
           establishment_processed_at: 6.days.ago,
           veteran_file_number: veteran.file_number)
    create(:higher_level_review,
           establishment_submitted_at: 6.days.ago,
           establishment_canceled_at: 5.days.ago,
           veteran_file_number: veteran.file_number)
    create(:higher_level_review,
           establishment_submitted_at: 37.days.ago,
           establishment_processed_at: 37.days.ago + 1.hour,
           veteran_file_number: veteran.file_number)
    create(:higher_level_review,
           establishment_submitted_at: 37.days.ago,
           establishment_processed_at: 37.days.ago + 4.hours,
           veteran_file_number: veteran.file_number)
    create(:higher_level_review,
           establishment_submitted_at: 237.days.ago,
           establishment_processed_at: 37.days.ago,
           veteran_file_number: veteran.file_number)
  end

  let!(:scs) do
    create(:supplemental_claim, veteran_file_number: veteran.file_number)
    create(:supplemental_claim,
           establishment_submitted_at: 37.days.ago,
           establishment_last_submitted_at: 37.days.ago,
           veteran_file_number: veteran.file_number)
    create(:supplemental_claim,
           establishment_submitted_at: 37.days.ago,
           establishment_processed_at: 6.days.ago,
           veteran_file_number: veteran.file_number)
    create(:supplemental_claim,
           establishment_submitted_at: 6.days.ago,
           establishment_processed_at: 5.days.ago,
           veteran_file_number: veteran.file_number)
    create(:supplemental_claim,
           establishment_submitted_at: 37.days.ago,
           establishment_canceled_at: 37.days.ago + 1.hour,
           veteran_file_number: veteran.file_number)
    create(:supplemental_claim,
           establishment_submitted_at: 37.days.ago,
           establishment_processed_at: 37.days.ago + 4.hours,
           veteran_file_number: veteran.file_number)
    create(:supplemental_claim,
           establishment_submitted_at: 237.days.ago,
           establishment_processed_at: 37.days.ago + 4.hours,
           veteran_file_number: veteran.file_number)
  end

  let!(:rius) do
    create(:request_issues_update)
    create(:request_issues_update,
           submitted_at: 37.days.ago,
           processed_at: 5.days.ago)
    create(:request_issues_update,
           submitted_at: 6.days.ago,
           processed_at: 5.days.ago)
    create(:request_issues_update,
           submitted_at: 37.days.ago,
           processed_at: 37.days.ago + 1.hour)
    create(:request_issues_update,
           submitted_at: 37.days.ago,
           canceled_at: 37.days.ago + 4.hours)
  end

  let!(:appeals) do
    create(:appeal, established_at: 35.days.ago)
    create(:appeal, established_at: Time.zone.today)
  end

  # rubocop:disable Metrics/LineLength
  let(:report) do
    "Monthly report 2019-02-01 to 2019-02-28\nAppeals established within 7 days: 1 (100%)\nSupplemental Claims within 7 days: 1 (25.0%)\nHigher Level Reviews within 7 days: 2 (50.0%)\ntype,total,in_progress,cancelled,processed,established_within_seven_days,established_within_seven_days_percent,median,avg,max,min\nsupplemental_claims,4,1,1,2,1,25.0,373:30:00,373:30:00,743:00:00,04:00:00\nhigher_level_reviews,4,1,0,3,2,50.0,01:00:00,249:20:00,743:00:00,01:00:00\nrequest_issues_updates,3,0,1,2,1,33.33,384:00:00,384:00:00,767:00:00,01:00:00\n"
  end
  # rubocop:enable Metrics/LineLength

  describe "#perform" do
    before do
      allow_any_instance_of(SlackService).to receive(:send_notification) { |_, first_arg| @slack_msg = first_arg }
    end

    it "sends message" do
      described_class.perform_now

      expect(@slack_msg).to eq(report)
    end
  end
end
