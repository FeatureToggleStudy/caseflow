import React, { useState } from 'react';
import PropTypes from 'prop-types';

import { Link } from 'react-router-dom';

import { MTVDispositionSelection } from './MTVDispositionSelection';
import TextareaField from '../../components/TextareaField';
import RadioField from '../../components/RadioField';
import {
  JUDGE_ADDRESS_MTV_TITLE,
  JUDGE_ADDRESS_MTV_DESCRIPTION,
  JUDGE_ADDRESS_MTV_DISPOSITION_SELECT_LABEL,
  JUDGE_ADDRESS_MTV_VACATE_TYPE_LABEL,
  JUDGE_ADDRESS_MTV_HYPERLINK_LABEL,
  JUDGE_ADDRESS_MTV_DISPOSITION_NOTES_LABEL,
  JUDGE_ADDRESS_MTV_ASSIGN_ATTORNEY_LABEL
} from '../../../COPY.json';
import { DISPOSITION_TEXT, VACATE_TYPE_OPTIONS } from '../../../constants/MOTION_TO_VACATE.json';
import { JUDGE_RETURN_TO_LIT_SUPPORT } from '../../../constants/TASK_ACTIONS.json';
import SearchableDropdown from '../../components/SearchableDropdown';
import AppSegment from '@department-of-veterans-affairs/caseflow-frontend-toolkit/components/AppSegment';
import Button from '../../components/Button';
import { css } from 'glamor';
import { MTVTaskHeader } from './MTVTaskHeader';
import TextField from '../../components/TextField';
import { MTVIssueSelection } from './MTVIssueSelection';
import StringUtil from '../../util/StringUtil';
import { MissingDenialDraftAlert } from './MissingDenialDraftAlert';

const vacateTypeText = (val) => {
  const opt = VACATE_TYPE_OPTIONS.find((i) => i.value === val);

  return opt && opt.displayText;
};

const formatInstructions = ({ disposition, vacateType, hyperlink, instructions }) => {
  const parts = [`I am proceeding with a ${DISPOSITION_TEXT[disposition]}.`];

  switch (disposition) {
  case 'granted':
  case 'partial':
    parts.push(`This will be a ${vacateTypeText(vacateType)}`);
    parts.push(instructions);
    break;
  default:
    parts.push(instructions);
    parts.push('\nHere is the hyperlink to the signed denial document');
    parts.push(hyperlink);
    break;
  }

  return parts.join('\n');
};

const grantTypes = ['granted', 'partial'];

export const MTVJudgeDisposition = ({
  attorneys,
  selectedAttorney,
  task,
  appeal,
  onSubmit = () => null,
  submitting = false,
  returnToLitSupportLink = JUDGE_RETURN_TO_LIT_SUPPORT.value
}) => {
  const cancelLink = `/queue/appeals/${task.externalAppealId}`;

  const [disposition, setDisposition] = useState(null);
  const [issueIds, setIssueIds] = useState([]);
  const [vacateType, setVacateType] = useState(null);
  const [instructions, setInstructions] = useState('');
  const [hyperlink, setHyperlink] = useState(null);
  const [attorneyId, setAttorneyId] = useState(selectedAttorney ? selectedAttorney.id : null);

  const handleSubmit = () => {
    const formattedInstructions = formatInstructions({
      disposition,
      vacateType,
      hyperlink,
      instructions
    });

    const result = {
      task_id: task.taskId,
      instructions: formattedInstructions,
      disposition,
      vacate_type: vacateType
    };

    if (issueIds.length) {
      result.vacated_decision_issue_ids = issueIds;
    }
    if (attorneyId) {
      result.assigned_to_id = attorneyId;
    }

    onSubmit(result);
  };

  const isGrantType = () => {
    return disposition && grantTypes.includes(disposition);
  };

  const isValid = () => {
    return !(
      !disposition ||
      !instructions ||
      (isGrantType() && !vacateType) ||
      (disposition === 'partial' && !issueIds.length) ||
      (!isGrantType() && !hyperlink)
    );
  };

  return (
    <div className="address-motion-to-vacate">
      <AppSegment filledBackground>
        <MTVTaskHeader title={JUDGE_ADDRESS_MTV_TITLE} task={task} appeal={appeal} />

        <p>{StringUtil.nl2br(JUDGE_ADDRESS_MTV_DESCRIPTION)}</p>

        <h3>Motion Attorney's Notes</h3>
        <p className="mtv-task-instructions">{task.instructions}</p>

        <div className="cf-help-divider" />

        <MTVDispositionSelection
          label={JUDGE_ADDRESS_MTV_DISPOSITION_SELECT_LABEL}
          allowPartial
          onChange={(val) => {
            setVacateType(null);
            setDisposition(val);
          }}
          value={disposition}
        />

        {disposition && disposition === 'partial' && (
          <MTVIssueSelection
            issues={appeal.decisionIssues}
            onChange={({ issueIds: newIssueIds }) => setIssueIds(newIssueIds)}
          />
        )}

        {disposition && disposition === 'denied' && <MissingDenialDraftAlert to={returnToLitSupportLink} />}

        {disposition && isGrantType() && (
          <RadioField
            name="vacate_type"
            label={JUDGE_ADDRESS_MTV_VACATE_TYPE_LABEL}
            options={VACATE_TYPE_OPTIONS}
            onChange={(val) => setVacateType(val)}
            value={vacateType}
            required
            className={['mtv-vacate-type']}
          />
        )}

        {disposition && !isGrantType() && (
          <TextField
            name="hyperlink"
            label={JUDGE_ADDRESS_MTV_HYPERLINK_LABEL}
            value={hyperlink}
            onChange={(val) => setHyperlink(val)}
            required
            className={['mtv-review-hyperlink']}
          />
        )}

        <TextareaField
          name="instructions"
          label={JUDGE_ADDRESS_MTV_DISPOSITION_NOTES_LABEL}
          onChange={(val) => setInstructions(val)}
          value={instructions}
          className={['mtv-decision-instructions']}
        />

        {disposition && isGrantType() && (
          <SearchableDropdown
            name="attorney"
            label={JUDGE_ADDRESS_MTV_ASSIGN_ATTORNEY_LABEL}
            searchable
            options={attorneys}
            placeholder="Select attorney"
            onChange={(option) => option && setAttorneyId(option.value)}
            value={attorneyId}
            styling={css({ width: '30rem' })}
          />
        )}
      </AppSegment>
      <div className="controls cf-app-segment">
        <Button
          type="button"
          name="submit"
          classNames={['cf-right-side']}
          onClick={handleSubmit}
          disabled={!isValid() || submitting}
          styling={css({ marginLeft: '1rem' })}
        >
          Submit
        </Button>
        <Link to={cancelLink}>
          <Button type="button" name="Cancel" classNames={['cf-right-side', 'usa-button-secondary']}>
            Cancel
          </Button>
        </Link>
      </div>
    </div>
  );
};

MTVJudgeDisposition.propTypes = {
  onSubmit: PropTypes.func.isRequired,
  submitting: PropTypes.bool,
  task: PropTypes.object.isRequired,
  appeal: PropTypes.object.isRequired,
  attorneys: PropTypes.array.isRequired,
  selectedAttorney: PropTypes.object,
  returnToLitSupportLink: PropTypes.string
};
