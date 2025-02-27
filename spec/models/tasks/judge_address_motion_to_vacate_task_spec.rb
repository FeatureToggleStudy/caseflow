# frozen_string_literal: true

require "support/database_cleaner"
require "rails_helper"

describe JudgeAddressMotionToVacateTask, :postgres do
  it "returns the correct label" do
    expect(JudgeAddressMotionToVacateTask.new.label).to eq(
      COPY::JUDGE_ADDRESS_MOTION_TO_VACATE_TASK_LABEL
    )
  end
end
