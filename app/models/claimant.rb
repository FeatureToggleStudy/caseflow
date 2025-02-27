# frozen_string_literal: true

class Claimant < ApplicationRecord
  include AssociatedBgsRecord

  belongs_to :decision_review, polymorphic: true
  belongs_to :person, primary_key: :participant_id, foreign_key: :participant_id

  bgs_attr_accessor :relationship

  validate { |claimant| ClaimantValidator.new(claimant).validate }
  validates :participant_id,
            uniqueness: { scope: [:decision_review_id, :decision_review_type],
                          on: :create }

  def self.create_from_intake_data!(participant_id:, payee_code:)
    create!(
      participant_id: participant_id,
      payee_code: payee_code
    )
    Person.find_or_create_by(participant_id: participant_id).tap(&:update_cached_attributes!)
  end

  def power_of_attorney
    @power_of_attorney ||= BgsPowerOfAttorney.new(claimant_participant_id: participant_id)
  end
  delegate :representative_name, :representative_type, :representative_address, to: :power_of_attorney

  def representative_participant_id
    power_of_attorney.participant_id
  end

  def person
    @person ||= Person.find_or_create_by(participant_id: participant_id)
  end

  delegate :date_of_birth, :advanced_on_docket?, :name, :first_name, :last_name, :middle_name, to: :person
  delegate :address, :address_line_1, :address_line_2, :address_line_3, :city, :country, :state, :zip,
           to: :bgs_address_service

  def fetch_bgs_record
    general_info = bgs.fetch_claimant_info_by_participant_id(participant_id)
    name_info = bgs.fetch_person_info(participant_id)

    general_info.merge(name_info)
  end

  def bgs_payee_code
    return unless bgs_record

    bgs_record[:payee_code]
  end

  def bgs_record
    @bgs_record ||= fetch_bgs_record
  end

  private

  def bgs_address_service
    @bgs_address_service ||= BgsAddressService.new(participant_id: participant_id)
  end
end
