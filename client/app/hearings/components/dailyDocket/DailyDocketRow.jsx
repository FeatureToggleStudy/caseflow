import React from 'react';
import { css } from 'glamor';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import _ from 'lodash';

import Button from '../../../components/Button';

import { onUpdateDocketHearing } from '../../actions/dailyDocketActions';
import { AodModal } from './DailyDocketModals';
import HearingText from './DailyDocketRowDisplayText';
import PropTypes from 'prop-types';
import {
  DispositionDropdown, TranscriptRequestedCheckbox, HearingDetailsLink,
  AmaAodDropdown, LegacyAodDropdown, AodReasonDropdown, HearingPrepWorkSheetLink, StaticRegionalOffice,
  NotesField, HearingLocationDropdown, StaticHearingDay, TimeRadioButtons,
  Waive90DayHoldCheckbox, HoldOpenDropdown
} from './DailyDocketRowInputs';
import VirtualHearingModal from '../VirtualHearingModal';

const SaveButton = ({ hearing, cancelUpdate, saveHearing }) => {
  return <div {...css({
    content: ' ',
    clear: 'both',
    display: 'block'
  })}>
    <Button
      styling={css({ float: 'left' })}
      linkStyling
      onClick={cancelUpdate}>
      Cancel
    </Button>
    <Button
      styling={css({ float: 'right' })}
      disabled={hearing.dateEdited && !hearing.dispositionEdited}
      onClick={saveHearing}>
      Save
    </Button>
  </div>;
};

SaveButton.propTypes = {
  hearing: PropTypes.object,
  cancelUpdate: PropTypes.func,
  saveHearing: PropTypes.func
};

const inputSpacing = css({
  '& > div:not(:first-child)': {
    marginTop: '25px'
  }
});

class HearingActions extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      initialState: {
        ...props.hearing
      },
      invalid: {
        advanceOnDocketMotionReason: false
      },
      aodModalActive: false,
      edited: false,
      virtualHearingModalActive: false
    };
  }

  update = (values) => {
    this.props.update(values);
    this.setState({ edited: true });
  }

  openAodModal = () => {
    this.setState({ aodModalActive: true });
  }

  closeAodModal = () => {
    this.setState({ aodModalActive: false });
  }

  updateAodMotion = (values) => {
    this.update({
      advanceOnDocketMotion: {
        ...(this.props.hearing.advanceOnDocketMotion || {}),
        ...values
      }
    });
  }
  openVirtualHearingModal = () => {
    this.setState({ virtualHearingModalActive: true });
  }
  closeVirtualHearingModal = () => {
    this.setState({ virtualHearingModalActive: false });
  }

  cancelUpdate = () => {
    this.props.update(this.state.initialState);
    this.setState({
      edited: false,
      invalid: {
        advanceOnDocketMotionReason: false
      }
    });
  }

  validate = () => {
    const { hearing } = this.props;

    const invalid = {
      advanceOnDocketMotionReason: hearing.advanceOnDocketMotion &&
        !_.isNil(hearing.advanceOnDocketMotion.granted) &&
        _.isNil(hearing.advanceOnDocketMotion.reason)
    };

    this.setState({ invalid });

    return !invalid.advanceOnDocketMotionReason;
  }

  aodDecidedByAnotherUser = () => {
    const { initialState } = this.state;
    const { user } = this.props;

    if (_.isNil(initialState.advanceOnDocketMotion) || !user.userHasHearingPrepRole) {
      return false;
    }

    return initialState.advanceOnDocketMotion.userId !== user.userId;
  }

  checkAodAndSave = () => {
    if (this.aodDecidedByAnotherUser()) {
      this.openAodModal();
    } else {
      this.saveHearing();
    }
  }

  saveHearing = () => {
    const isValid = this.validate();

    if (!isValid) {
      return;
    }

    this.props.saveHearing(this.props.hearingId).
      then((success) => {
        if (success) {
          this.setState({
            initialState: { ...this.props.hearing },
            edited: false
          });
        }
      });
  }

  isAmaHearing = () => this.props.hearing.docketName === 'hearing'

  isLegacyHearing = () => this.props.hearing.docketName === 'legacy'

  getInputProps = () => {
    const { hearing, readOnly } = this.props;

    return {
      hearing,
      readOnly,
      update: this.update
    };
  }

  defaultRightInputs = () => {
    const { hearing, regionalOffice } = this.props;
    const inputProps = this.getInputProps();

    return <React.Fragment>
      <StaticRegionalOffice hearing={hearing} />
      <HearingLocationDropdown {...inputProps} regionalOffice={regionalOffice} />
      <StaticHearingDay hearing={hearing} />
      <TimeRadioButtons {...inputProps} regionalOffice={regionalOffice} update={(values) => {
        this.update(values);
        if (values.scheduledTimeString !== null) {
          this.openVirtualHearingModal();
        }
      }} />
    </React.Fragment>;
  }

  judgeRightInputs = () => {
    const { hearing, user } = this.props;
    const inputProps = this.getInputProps();

    return <React.Fragment>
      <HearingPrepWorkSheetLink hearing={hearing} />
      {this.isAmaHearing() && <React.Fragment>
        <AmaAodDropdown {...inputProps} updateAodMotion={this.updateAodMotion} userId={user.userId} />
        <AodReasonDropdown {...inputProps}
          updateAodMotion={this.updateAodMotion}
          userId={user.userId}
          invalid={this.state.invalid.advanceOnDocketMotionReason} />
      </React.Fragment>}
      {this.isLegacyHearing() && <React.Fragment>
        <LegacyAodDropdown {...inputProps} />
        <HoldOpenDropdown {...inputProps} />
      </React.Fragment>}
    </React.Fragment>;
  }

  getRightColumn = () => {
    const inputs = this.props.user.userHasHearingPrepRole ? this.judgeRightInputs() : this.defaultRightInputs();

    return <div {...inputSpacing}>
      {inputs}
      {this.state.edited &&
        <SaveButton
          hearing={this.props.hearing}
          cancelUpdate={this.cancelUpdate}
          saveHearing={this.checkAodAndSave} />}
    </div>;
  }

  getLeftColumn = () => {
    const { hearing, user, openDispositionModal } = this.props;

    const inputProps = this.getInputProps();

    return <div {...inputSpacing}>
      <DispositionDropdown {...inputProps}
        cancelUpdate={this.cancelUpdate}
        saveHearing={this.saveHearing}
        openDispositionModal={openDispositionModal} />
      {(user.userHasHearingPrepRole && this.isAmaHearing()) &&
        <Waive90DayHoldCheckbox {...inputProps} />}
      <TranscriptRequestedCheckbox {...inputProps} />
      {(user.userCanAssignHearingSchedule && !user.userHasHearingPrepRole) && <HearingDetailsLink hearing={hearing} />}
      <NotesField {...inputProps} readOnly={user.userCanVsoHearingSchedule} />
    </div>;
  }

  render () {
    const { hearing, user, index, readOnly } = this.props;

    return <React.Fragment>
      <div>
        <HearingText
          readOnly={readOnly}
          update={this.update}
          hearing={hearing}
          initialState={this.state.initialState}
          user={user}
          index={index} />
      </div><div>
        {this.getLeftColumn()}
        {this.getRightColumn()}
      </div>
      {/* This is where the modal for the edit virtual hearing modal is supposed to appear*/}
      {(user.userCanScheduleVirtualHearings && this.state.virtualHearingModalActive) &&
        <VirtualHearingModal hearing={hearing}
          timeWasEdited={this.state.initialState.scheduledTimeString !== _.get(hearing, 'scheduledTimeString')}
          virtualHearing={hearing.virtualHearing || {}} reset={() => {
            this.update({ scheduledTimeString: this.state.initialState.scheduledTimeString });
            this.closeVirtualHearingModal()
            ;
          }} user={user}
          submit={() => {
            this.saveHearing();
            this.closeVirtualHearingModal();
          }}
        />}
      {this.state.aodModalActive && <AodModal
        advanceOnDocketMotion={hearing.advanceOnDocketMotion || {}}
        onConfirm={() => {
          this.saveHearing();
          this.closeAodModal();
        }}
        onCancel={() => {
          this.updateAodMotion(this.state.initialState.advanceOnDocketMotion);
          this.closeAodModal();
        }}
      />}
    </React.Fragment>;
  }
}

HearingActions.propTypes = {
  index: PropTypes.number,
  hearingId: PropTypes.string,
  update: PropTypes.func,
  saveHearing: PropTypes.func,
  openDispositionModal: PropTypes.func,
  regionalOffice: PropTypes.string,
  readOnly: PropTypes.bool,
  hearing: PropTypes.shape({
    docketName: PropTypes.string,
    advanceOnDocketMotion: PropTypes.object,
    virtualHearing: PropTypes.object
  }),
  user: PropTypes.shape({
    userCanAssignHearingSchedule: PropTypes.bool,
    userCanBuildHearingSchedule: PropTypes.bool,
    userCanViewHearingSchedule: PropTypes.bool,
    userCanVsoHearingSchedule: PropTypes.bool,
    userHasHearingPrepRole: PropTypes.bool,
    userInHearingOrTranscriptionOrganization: PropTypes.bool,
    userCanScheduleVirtualHearings: PropTypes.bool,
    userId: PropTypes.number,
    userCssId: PropTypes.string
  })
};

const mapStateToProps = (state, props) => ({
  hearing: props.hearingId ? state.dailyDocket.hearings[props.hearingId] : {}
});

const mapDispatchToProps = (dispatch, props) => bindActionCreators({
  update: (values) => onUpdateDocketHearing(props.hearingId, values)
}, dispatch);

export default connect(mapStateToProps, mapDispatchToProps)(HearingActions);

