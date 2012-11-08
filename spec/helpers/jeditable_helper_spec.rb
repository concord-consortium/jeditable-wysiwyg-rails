require 'spec_helper'

describe JeditableHelper do
  describe "editable_field" do
    it "displays the value of the object" do
      gadget = Gadget.new(:name => 'First')
      helper.editable_field(gadget, :name).should =~ /First/
    end
  end

  describe 'editable_with_trigger' do
    before do
      @gadget = Gadget.new(:name => 'First')
    end

    it "displays the value of the object" do
      helper.editable_with_trigger(@gadget, :name).should =~ /First/
    end

    it "displays an edit-triggering span" do
      helper.editable_with_trigger(@gadget, :name).should =~ /span class="edit_trigger"/
    end

    it "uses the edit_string option as the text of the edit-triggering span" do
      helper.editable_with_trigger(@gadget, :name, { :edit_string => 'Yo, edit this!'}).should =~ /Yo, edit this!/
    end
  end
end
