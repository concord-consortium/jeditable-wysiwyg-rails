require 'jeditable_wysiwyg_rails/helpers/jeditable_helper'

module ActionView
  class Base
    include JeditableHelper
  end
end
