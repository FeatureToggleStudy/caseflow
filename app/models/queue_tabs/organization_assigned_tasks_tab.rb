# frozen_string_literal: true

class OrganizationAssignedTasksTab < QueueTab
  validate :assignee_is_organization

  def label
    COPY::QUEUE_PAGE_ASSIGNED_TAB_TITLE
  end

  def self.tab_name
    Constants.QUEUE_CONFIG.ASSIGNED_TASKS_TAB_NAME
  end

  def description
    format(COPY::ORGANIZATIONAL_QUEUE_PAGE_ASSIGNED_TASKS_DESCRIPTION, assignee.name)
  end

  def tasks
    Task.includes(*task_includes).visible_in_queue_table_view.active.where(parent: on_hold_tasks)
  end

  # rubocop:disable Metrics/AbcSize
  def column_names
    [
      Constants.QUEUE_CONFIG.COLUMNS.HEARING_BADGE.name,
      Constants.QUEUE_CONFIG.COLUMNS.CASE_DETAILS_LINK.name,
      Constants.QUEUE_CONFIG.COLUMNS.TASK_TYPE.name,
      show_regional_office_column ? Constants.QUEUE_CONFIG.COLUMNS.REGIONAL_OFFICE.name : nil,
      Constants.QUEUE_CONFIG.COLUMNS.APPEAL_TYPE.name,
      Constants.QUEUE_CONFIG.COLUMNS.TASK_ASSIGNEE.name,
      Constants.QUEUE_CONFIG.COLUMNS.DOCKET_NUMBER.name,
      Constants.QUEUE_CONFIG.COLUMNS.DAYS_WAITING.name
    ].compact
  end
  # rubocop:enable Metrics/AbcSize
end
