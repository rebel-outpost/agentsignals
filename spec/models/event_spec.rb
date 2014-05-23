require 'spec_helper'

describe Event do

  describe :end_date? do
    context "When there is an end date" do
      before {@event = FactoryGirl.create :event, ends: DateTime.now + 7.days}
      it {@event.end_date?.should eq true}
    end

    context "When there is NOT an end date" do
      before {@event = FactoryGirl.create :event}
      it {@event.end_date?.should eq false}
    end
  end

  describe :end_date_is_after_start_date do 
    context "When end date is after the start date" do
      before {@event = FactoryGirl.build :event, ends: DateTime.now + 7.days}

      it {@event.should be_valid}
    end

    context "When end date is before the start date" do 
      before {@event = FactoryGirl.build :event, ends: DateTime.now - 7.days}

      it {@event.should_not be_valid}
      it {@event.should have(1).error_on(:ends)}
    end
  end
end
