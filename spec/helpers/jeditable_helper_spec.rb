require 'spec_helper'

describe JeditableHelper do
  describe "editable_field" do
    it "displays the value of the object" do
      gadget = Gadget.new(:name => 'First')
      helper.editable_field(gadget, :name).should =~ /First/
    end

    it 'uses put by default'

    it 'uses post when supplied that parameter'

    it 'calculates a name parameter when none is supplied'

    it 'uses a supplied name parameter'

    it 'calculates a target URL from the object'

    it 'uses a supplied URL parameter'

    context 'when editing is triggered by a control' do
      it 'binds edit action to edit-click'

      it 'shows a trigger with the appropriate text'
    end

    context 'when open-in-edit is requested' do
      it 'opens in edit mode if value is blank'

      it 'does not open in edit mode if value exists'
    end
  end

  describe 'editable_field_if' do
    it 'shows an editable field when condition is true'

    it 'shows the field value with no function bound to click when condition is false'
  end
end
