require 'spec_helper'

describe JeditableHelper do
  before do
    # Because this all happens without the context of a request, url_for doesn't
    # work - and we don't need it to.
    helper.stub(:url_for).and_return('/path')
    @gadget = Gadget.new(:name => 'First')
  end

  describe "editable_field" do
    it "displays the value of the object" do
      helper.editable_field(@gadget, :name).should =~ /First/
    end

    it 'uses put by default' do
      helper.editable_field(@gadget, :name).should =~ /"method":"PUT"/
    end

    it 'uses post when supplied that parameter' do
      helper.editable_field(@gadget, :name, { :method => 'POST' }).should =~ /"method":"POST"/
    end

    it 'calculates a name parameter when none is supplied' do
      helper.editable_field(@gadget, :name).should =~ /"name":"gadget\[name\]"/
    end

    it 'uses a supplied name parameter' do
      helper.editable_field(@gadget, :name, { :name => 'special_gadget_name' }).should =~ /"name":"special_gadget_name\[name\]"/
    end

    it 'calculates a target URL from the object' do
      # Because url_for is stubbed, we just want the stub output
      helper.editable_field(@gadget, :name).should =~ /editable\("\/path", args\)/
    end

    it 'uses a supplied URL parameter' do
      helper.editable_field(@gadget, :name, { :update_url => '/gadget/1' }).should =~ /editable\("\/gadget\/1", args\)/
    end

    context 'when editing is triggered by a control' do
      it 'binds edit action to edit-click' do
        helper.editable_field(@gadget, :name, { :use_trigger => true }).should =~ /<span class="edit_trigger"[^>]*>Edit/
      end

      it 'shows a trigger with the appropriate text' do
        helper.editable_field(@gadget, :name, { :use_trigger => true, :edit_string => 'Click me' }).should =~ /<span class="edit_trigger"[^>]*>Click me/
      end
    end

    context 'when open-in-edit is requested' do
      it 'opens in edit mode if value is blank' do
        @gadget.name = ''
        helper.editable_field(@gadget, :name, { :open_if_empty => true }).should =~ /\.trigger\('click'\)/
      end

      it 'does not open in edit mode if value exists' do
        helper.editable_field(@gadget, :name, { :open_if_empty => true }).should_not =~ /\.trigger\('click'\)/
      end
    end

    context 'when editing a rich-text element' do
      # Ultimately we need to trust our JS components to be reliable, i.e. they have their own tests.
      # This component just puts them on the page.
    end
  end

  describe 'editable_field_if' do
    it 'shows an editable field when condition is true' do
      helper.editable_field_if(true, @gadget, :name).should =~ /class="editable"/
    end

    it 'shows the field value with no function bound to click when condition is false' do
      helper.editable_field_if(false, @gadget, :name).should_not =~ /class="editable"/
      helper.editable_field_if(true, @gadget, :name).should =~ /First/
    end
  end
end
