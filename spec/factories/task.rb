# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    assigned_at { rand(30..35).days.ago }
    association :assigned_by, factory: :user
    association :assigned_to, factory: :user
    appeal { create(:legacy_appeal, vacols_case: create(:case)) }
    type { Task.name }

    trait :assigned do
      status { Constants.TASK_STATUSES.assigned }
    end

    trait :in_progress do
      started_at { rand(1..10).days.ago }

      after(:create) do |task|
        task.update_columns(status: Constants.TASK_STATUSES.in_progress)
        task.children.update_all(status: Constants.TASK_STATUSES.in_progress)
      end
    end

    trait :on_hold do
      started_at { rand(20..30).days.ago }
      placed_on_hold_at { rand(1..10).days.ago }
      on_hold_duration { [30, 60, 90].sample }

      after(:create) do |task|
        task.update_columns(status: Constants.TASK_STATUSES.on_hold)
        task.children.update_all(status: Constants.TASK_STATUSES.on_hold)
      end
    end

    trait :completed_hold do
      started_at { rand(25..30).days.ago }
      placed_on_hold_at { rand(15..25).days.ago }
      on_hold_duration { 10 }

      after(:create) do |task|
        task.update_columns(status: Constants.TASK_STATUSES.on_hold)
        task.children.update_all(status: Constants.TASK_STATUSES.on_hold)
      end
    end

    trait :completed do
      started_at { rand(20..30).days.ago }
      placed_on_hold_at { rand(1..10).days.ago }
      on_hold_duration { [30, 60, 90].sample }
      closed_at { Time.zone.now }

      after(:create) do |task|
        task.update_columns(status: Constants.TASK_STATUSES.completed)
        task.children.update_all(status: Constants.TASK_STATUSES.completed)
      end
    end

    trait :completed_in_the_past do
      started_at { rand(20..30).weeks.ago }
      placed_on_hold_at { rand(4..10).weeks.ago }
      on_hold_duration { [30, 60, 90].sample }

      after(:create) do |task|
        task.update_columns(status: Constants.TASK_STATUSES.completed, closed_at: 3.weeks.ago)
        task.children.update_all(status: Constants.TASK_STATUSES.completed, closed_at: 3.weeks.ago)
      end
    end

    trait :cancelled do
      closed_at { Time.zone.now }

      after(:create) do |task|
        task.update_columns(status: Constants.TASK_STATUSES.cancelled)
        task.children.update_all(status: Constants.TASK_STATUSES.cancelled)
      end
    end

    factory :root_task, class: RootTask do
      type { RootTask.name }
      appeal
      assigned_by { nil }
      assigned_to { Bva.singleton }
    end

    factory :distribution_task, class: DistributionTask do
      type { DistributionTask.name }
      appeal { create(:appeal) }
      assigned_by { nil }
      assigned_to { Bva.singleton }

      after(:create) do |task|
        task.update(status: Constants.TASK_STATUSES.on_hold)
        task.children.update_all(status: Constants.TASK_STATUSES.on_hold)
      end
    end

    factory :generic_task, class: Task do
      type { Task.name }
      appeal { create(:appeal) }
    end

    factory :pulac_cerullo_task, class: PulacCerulloTask do
      type { PulacCerulloTask.name }
      appeal { create(:appeal) }
    end

    factory :privacy_act_task, class: PrivacyActTask do
      type { PrivacyActTask.name }
      appeal { create(:appeal) }
    end

    factory :foia_task, class: FoiaTask do
      appeal
      type { FoiaTask.name }
    end

    factory :timed_hold_task, class: TimedHoldTask do
      type { TimedHoldTask.name }
      appeal { create(:appeal) }
      assigned_to { create(:user) }
      days_on_hold { rand(1..100) }
      parent { create(:generic_task) }
    end

    factory :colocated_task, traits: [ColocatedTask.actions_assigned_to_colocated.sample.to_sym] do
      parent { create(:generic_task) }
      assigned_to { Colocated.singleton }

      factory :ama_colocated_task, traits: [ColocatedTask.actions_assigned_to_colocated.sample.to_sym] do
        appeal { create(:appeal) }
      end

      trait :ihp do
        initialize_with { IhpColocatedTask.new(attributes) }
        type { IhpColocatedTask.name }
        instructions { ["Hello. It appears that the VSO has not reviewed this case and has not provided an IHP."] }
      end

      trait :poa_clarification do
        initialize_with { PoaClarificationColocatedTask.new(attributes) }
        type { PoaClarificationColocatedTask.name }
        instructions do
          ["We received some correspondence from the Veteran's attorney in November " \
          "indicating the attorney wants to withdraw from representation of the Veteran. " \
          "I don't see any paperwork from the Veteran appointing a new rep or otherwise " \
          "acknowledging the withdraw of the old one. Please contact the Veteran to " \
          "clarify if they have current representation. If the Veteran no longer " \
          "wishes the current representative to act on his behalf, please get that in writing."]
        end
      end

      trait :hearing_clarification do
        initialize_with { HearingClarificationColocatedTask.new(attributes) }
        type { HearingClarificationColocatedTask.name }
        instructions do
          ["A March statement filed by the Veteran indicates that they desired " \
          "a 'Televideo conference hearing' for all their appeals. No hearing " \
          "was scheduled. Please clarify whether the Veteran still desires a " \
          "Board hearing, and, if so, please reroute as necessary to schedule one. Thanks!"]
        end
      end

      trait :aoj do
        initialize_with { AojColocatedTask.new(attributes) }
        type { AojColocatedTask.name }
        instructions do
          ["Please clarify whether the Veteran desires AOJ review of any evidence, to include VA " \
          "treatment records dated through June, submitted since an April statement of the case. Thank you!"]
        end
      end

      trait :extension do
        initialize_with { ExtensionColocatedTask.new(attributes) }
        type { ExtensionColocatedTask.name }
        instructions do
          ["The Veteran's POA submitted a letter requesting a 90 day extension. Please send " \
          "letter granting the extension."]
        end
      end

      trait :missing_hearing_transcripts do
        initialize_with { MissingHearingTranscriptsColocatedTask.new(attributes) }
        type { MissingHearingTranscriptsColocatedTask.name }
        assigned_to { MissingHearingTranscriptsColocatedTask.default_assignee }
        instructions do
          ["Good evening, could you please return this to the hearing " \
          "branch as the hearing was just held and the transcripts are " \
          "not yet available. Thank you."]
        end
      end

      trait :unaccredited_rep do
        initialize_with { UnaccreditedRepColocatedTask.new(attributes) }
        type { UnaccreditedRepColocatedTask.name }
        instructions { ["Unaccredited rep"] }
      end

      trait :foia do
        initialize_with { FoiaColocatedTask.new(attributes) }
        type { FoiaColocatedTask.name }
        assigned_to { FoiaColocatedTask.default_assignee }
        instructions do
          ["The Veteran's representative submitted FOIA request in December of last year, which " \
          "was acknowledged the same month. To date, there has been no response provided. " \
          "Please follow up on the FOIA request."]
        end
      end

      trait :retired_vlj do
        initialize_with { RetiredVljColocatedTask.new(attributes) }
        type { RetiredVljColocatedTask.name }
        instructions do
          ["VLJ Snuffy conducted the hearing in June. Since they are now retired, the " \
          "Veteran needs to be provided notice of this and an opportunity to request " \
          "hearing before another VLJ."]
        end
      end

      trait :arneson do
        initialize_with { ArnesonColocatedTask.new(attributes) }
        type { ArnesonColocatedTask.name }
        instructions { ["email was sent re Arneson letter/ the Veteran needing to be offered a third hearing."] }
      end

      trait :new_rep_arguments do
        initialize_with { NewRepArgumentsColocatedTask.new(attributes) }
        type { NewRepArgumentsColocatedTask.name }
        instructions do
          ["The Veteran recently switched to a new POA. Please determine if the " \
          "new POA will provide new arguments for the issues on appeal."]
        end
      end

      trait :pending_scanning_vbms do
        initialize_with { PendingScanningVbmsColocatedTask.new(attributes) }
        type { PendingScanningVbmsColocatedTask.name }
        instructions do
          ["There is a pending scanning banner in VBMS indicating documents " \
          "from November are pending scanning. The last documents uploaded " \
          "to the file are from October. Please hold the case in abeyance " \
          "for 2 weeks to allow the documents to be uploaded and the PSB to clear."]
        end
      end

      trait :address_verification do
        initialize_with { AddressVerificationColocatedTask.new(attributes) }
        type { AddressVerificationColocatedTask.name }
        instructions do
          ["VACOLS and Caseflow lists two different addresses for the Veteran. " \
          "From reviewing the recent documents in the file, it appears that " \
          "the address in Caseflow is the most recent address. Please verify " \
          "the Veteran's current address and update VACOLS if warranted."]
        end
      end

      trait :schedule_hearing do
        initialize_with { ScheduleHearingColocatedTask.new(attributes) }
        type { ScheduleHearingColocatedTask.name }
        assigned_to { ScheduleHearingColocatedTask.default_assignee }
        instructions do
          ["The Veteran has requested a Board hearing as to all appealed issues. " \
          "To date, no Board hearing has been scheduled."]
        end
      end

      trait :missing_records do
        initialize_with { MissingRecordsColocatedTask.new(attributes) }
        type { MissingRecordsColocatedTask.name }
        instructions do
          ["The Veteran had a Board Video Conference Hearing in September with " \
          "Judge Snuffy. The Hearing transcripts are not of record."]
        end
      end

      trait :translation do
        initialize_with { TranslationColocatedTask.new(attributes) }
        type { TranslationColocatedTask.name }
        assigned_to { TranslationColocatedTask.default_assignee }
        instructions do
          ["There are multiple document files that still require translation from " \
          "Spanish to English. The files in Spanish have been marked in Caseflow. " \
          "Please have these documents translated. Thank you!"]
        end
      end

      trait :stayed_appeal do
        initialize_with { StayedAppealColocatedTask.new(attributes) }
        type { StayedAppealColocatedTask.name }
        instructions { ["Appeal stayed because Veteran fulls under Blue Water Navy Veteran policy."] }
      end

      trait :other do
        initialize_with { OtherColocatedTask.new(attributes) }
        type { OtherColocatedTask.name }
        instructions { ["Please request a waiver of AOJ consideration for new evidence"] }
      end

      after(:build) do |task|
        # Create a RootTask for this appeal unless one already exists because ColocatedTasks with the schedule_hearing
        # action can create ScheduleHearingTasks which require the appeal to have a RootTask.
        # github.com/department-of-veterans-affairs/caseflow
        #   /blob/2bf6503e7f0888abc3222caaba499d8e7db14ae4/app/models/tasks/colocated_task.rb#L134
        RootTask.create!(appeal: task.appeal) unless task.appeal.root_task
      end
    end

    factory :ama_judge_task, class: JudgeAssignTask do
      type { JudgeAssignTask.name }
      appeal { create(:appeal) }
    end

    factory :assign_hearing_disposition_task, class: AssignHearingDispositionTask do
      type { AssignHearingDispositionTask.name }
      assigned_to { Bva.singleton }
      appeal { create(:appeal) }
      parent { create(:hearing_task) }
    end

    factory :change_hearing_disposition_task, class: ChangeHearingDispositionTask do
      type { ChangeHearingDispositionTask.name }
      assigned_to { HearingAdmin.singleton }
      appeal { create(:appeal) }
    end

    factory :ama_judge_decision_review_task, class: JudgeDecisionReviewTask do
      type { JudgeDecisionReviewTask.name }
      appeal { create(:appeal) }
    end

    factory :ama_judge_quality_review_task, class: JudgeQualityReviewTask do
      type { JudgeQualityReviewTask.name }
      appeal { create(:appeal) }
    end

    factory :ama_judge_dispatch_return_task, class: JudgeDispatchReturnTask do
      type { JudgeDispatchReturnTask.name }
      appeal { create(:appeal) }
      parent { create(:root_task, appeal: appeal) }
    end

    factory :track_veteran_task, class: TrackVeteranTask do
      type { TrackVeteranTask.name }
      appeal { create(:appeal) }
    end

    factory :translation_task, class: TranslationTask do
      type { TranslationTask.name }
      appeal { create(:appeal) }
    end

    factory :hearing_task, class: HearingTask do
      type { HearingTask.name }
      assigned_to { Bva.singleton }
      appeal { create(:appeal) }
      parent { appeal.root_task || create(:root_task, appeal: appeal) }
    end

    factory :schedule_hearing_task, class: ScheduleHearingTask do
      type { ScheduleHearingTask.name }
      appeal { create(:appeal) }
      assigned_to { Bva.singleton }
      parent { create(:hearing_task, appeal: appeal) }
    end

    factory :appeal_withdrawal_mail_task, class: AppealWithdrawalMailTask do
      type { AppealWithdrawalMailTask.name }
      appeal { create(:appeal) }
      assigned_to { MailTeam.singleton }
      parent { create(:root_task, appeal: appeal) }
    end

    factory :appeal_withdrawal_bva_task, class: AppealWithdrawalMailTask do
      type { AppealWithdrawalMailTask.name }
      appeal { create(:appeal) }
      assigned_to { BvaIntake.singleton }
      parent { create(:appeal_withdrawal_mail_task, appeal: appeal) }
    end

    factory :returned_undeliverable_correspondence_mail_task, class: ReturnedUndeliverableCorrespondenceMailTask do
      type { ReturnedUndeliverableCorrespondenceMailTask.name }
      appeal { create(:appeal) }
      assigned_to { BvaDispatch.singleton }
      parent { create(:root_task, appeal: appeal) }
    end

    factory :no_show_hearing_task, class: NoShowHearingTask do
      type { NoShowHearingTask.name }
      appeal { create(:appeal) }
      assigned_to { HearingsManagement.singleton }
      parent { create(:assign_hearing_disposition_task, appeal: appeal) }
    end

    factory :evidence_submission_window_task, class: EvidenceSubmissionWindowTask do
      type { EvidenceSubmissionWindowTask.name }
      appeal { create(:appeal) }
      assigned_to { MailTeam.singleton }
      parent { create(:assign_hearing_disposition_task, appeal: appeal) }
    end

    factory :ama_attorney_task, class: AttorneyTask do
      type { AttorneyTask.name }
      appeal { create(:appeal) }
      parent { create(:ama_judge_decision_review_task) }
      assigned_by { create(:user) }
      assigned_to { create(:user) }

      after(:build) do |_task, evaluator|
        if evaluator.assigned_by
          existing_staff_record = VACOLS::Staff.where(
            sdomainid: evaluator.assigned_by.css_id, svlj: "J", sactive: "A"
          ).first
          create(:staff, :judge_role, user: evaluator.assigned_by) if existing_staff_record.blank?
        end

        if evaluator.assigned_to
          existing_staff_record = VACOLS::Staff.where(sdomainid: evaluator.assigned_to.css_id, sactive: "A").first
          create(:staff, :attorney_role, user: evaluator.assigned_to) if existing_staff_record.blank?
        end
      end
    end

    factory :ama_attorney_rewrite_task, class: AttorneyRewriteTask do
      type { AttorneyRewriteTask.name }
      appeal { create(:appeal) }
      parent { create(:ama_judge_decision_review_task) }
    end

    factory :ama_judge_dispatch_return_to_attorney_task, class: AttorneyDispatchReturnTask do
      type { AttorneyDispatchReturnTask.name }
      appeal { create(:appeal) }
      parent { create(:ama_judge_decision_review_task) }
    end

    factory :transcription_task, class: TranscriptionTask do
      type { TranscriptionTask.name }
      appeal { create(:appeal) }
      parent { create(:root_task, appeal: appeal) }
      assigned_to { TranscriptionTeam.singleton }
    end

    factory :ama_vso_task, class: Task do
      type { Task.name }
      appeal { create(:appeal) }
      parent { create(:root_task) }
    end

    factory :qr_task, class: QualityReviewTask do
      type { QualityReviewTask.name }
      appeal { create(:appeal) }
      parent { create(:root_task) }
      assigned_by { nil }
      assigned_to { QualityReview.singleton }
    end

    factory :quality_review_task, class: QualityReviewTask do
      type { QualityReviewTask.name }
      appeal { create(:appeal) }
      assigned_by { nil }
    end

    factory :bva_dispatch_task, class: BvaDispatchTask do
      type { BvaDispatchTask.name }
      appeal { create(:appeal) }
      assigned_by { nil }
    end

    factory :hearing_admin_action_task, class: HearingAdminActionTask do
      type { HearingAdminActionTask.name }
      appeal { create(:appeal) }
      assigned_by { nil }
    end

    factory :hearing_admin_action_incarcerated_veteran_task, class: HearingAdminActionIncarceratedVeteranTask do
      type { HearingAdminActionIncarceratedVeteranTask.name }
      appeal { create(:appeal) }
      assigned_by { nil }
    end

    factory :hearing_admin_action_verify_address_task, class: HearingAdminActionVerifyAddressTask do
      type { HearingAdminActionVerifyAddressTask.name }
      appeal { create(:appeal) }
      assigned_by { nil }
    end

    factory :informal_hearing_presentation_task, class: InformalHearingPresentationTask do
      type { InformalHearingPresentationTask.name }
      appeal { create(:appeal) }
      assigned_by { nil }
    end

    factory :appeal_task, class: DecisionReviewTask do
      type { DecisionReviewTask.name }
      appeal { create(:appeal, benefit_type: "education") }
      assigned_by { nil }
    end

    factory :higher_level_review_task, class: DecisionReviewTask do
      type { DecisionReviewTask.name }
      appeal { create(:higher_level_review, benefit_type: "education") }
      assigned_by { nil }
    end

    factory :board_grant_effectuation_task, class: BoardGrantEffectuationTask do
      type { BoardGrantEffectuationTask.name }
      appeal { create(:appeal) }
      assigned_by { nil }
    end

    factory :veteran_record_request_task, class: VeteranRecordRequest do
      type { VeteranRecordRequest.name }
      appeal { create(:appeal) }
      parent { create(:root_task) }
      assigned_by { nil }
    end

    factory :aod_motion_mail_task, class: AodMotionMailTask do
      type { AodMotionMailTask.name }
      appeal { create(:appeal) }
      parent { create(:root_task) }
      assigned_to { MailTeam.singleton }
      assigned_by { nil }
    end

    factory :vacate_motion_mail_task, class: VacateMotionMailTask do
      type { VacateMotionMailTask.name }
      appeal { create(:appeal) }
      parent { create(:root_task) }
      assigned_to { LitigationSupport.singleton }
    end

    factory :congressional_interest_mail_task, class: CongressionalInterestMailTask do
      type { CongressionalInterestMailTask.name }
      appeal { create(:appeal) }
      parent { create(:root_task) }
      assigned_to { MailTeam.singleton }
      assigned_by { nil }
    end

    factory :judge_address_motion_to_vacate_task, class: JudgeAddressMotionToVacateTask do
      type { JudgeAddressMotionToVacateTask.name }
      appeal
      association :parent, factory: :vacate_motion_mail_task
    end

    factory :abstract_motion_to_vacate_task, class: AbstractMotionToVacateTask do
      type { AbstractMotionToVacateTask.name }
      appeal
      association :parent, factory: :vacate_motion_mail_task
    end

    factory :denied_motion_to_vacate_task, class: DeniedMotionToVacateTask do
      type { DeniedMotionToVacateTask.name }
      appeal
      association :parent, factory: :abstract_motion_to_vacate_task
      assigned_by { create(:user, full_name: "Judge User", css_id: "JUDGE_1") }
      assigned_to { create(:user, full_name: "Motions Attorney", css_id: "LIT_SUPPORT_ATTY_1") }
    end

    factory :judge_sign_motion_to_vacate_task, class: JudgeSignMotionToVacateTask do
      type { JudgeSignMotionToVacateTask.name }
      appeal
      association :parent, factory: :abstract_motion_to_vacate_task
    end
  end
end
