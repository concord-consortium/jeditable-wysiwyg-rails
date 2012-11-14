module JeditableHelper
  # If the <tt>condition</tt> evaluates to <tt>true</tt>, an editable field
  # will be created.  Otherwise, the value of the property of the object is
  # returned.  See #editable_field for options.
  def editable_field_if(condition, object, property, options={})
    if condition
      editable_field(object, property, options)
    else
      object.send property
    end
  end

  # Creates an editable span for the given property of the given object.
  #
  # === Options
  #
  # [:method]
  #   Specify the HTTP method to use: <tt>'PUT'</tt> or <tt>'POST'</tt>.
  # [:name]
  #   The <tt>name</tt> attribute to be used when the form is posted.
  # [:update_url]
  #   The URL to submit the form to.  Defaults to <tt>url_for(object)</tt>.
  # [:use_trigger]
  #   Boolean: if true, use :edit_string (default: 'Edit') as a button
  #   which starts edit mode.
  # [:edit_string]
  #   If :use_trigger is true, this string will be used as the text of a 
  #   button which starts edit mode. Defaults to "Edit".
  # [:open_if_empty]
  #   Boolean: If true and the attribute being edited is blank (nil or '')
  #   the editable area will open edit mode immediately rather than waiting
  #   for a trigger event.
  def editable_field(object, property, options={})
    name = "#{object.class.to_s.underscore}[#{property}]"
    value = object.send property
    update_url = options.delete(:update_url) || url_for(object)
    trigger_event = options[:use_trigger] ? 'edit-click' : 'click'
    open_in_edit = (options[:open_if_empty] && value.blank?) ? ".trigger('#{trigger_event}')" : ''
    args = {:method => 'PUT', :name => name, :event => trigger_event }.merge(options)
    %{
      <span class="editable" data-id="#{object.id}" data-name="#{name}">#{value}</span>
      <script type="text/javascript">
        (function( $ ){
          $(function(){
            var args = {data: function(value, settings) {
              // Unescape HTML
              var retval = value
                .replace(/&amp;/gi, '&')
                .replace(/&gt;/gi, '>')
                .replace(/&lt;/gi, '<')
                .replace(/&quot;/gi, "\\\"");
              return retval;
            }};
            $.extend(args, #{args.to_json});
            $(".editable[data-id='#{object.id}'][data-name='#{name}']").editable("#{update_url}", args)#{open_in_edit};
          });
        })( jQuery );
      </script>
      #{editable_trigger(name, options[:edit_string], object.id) if options[:use_trigger]}
    }.html_safe
  end

  # Creates a trigger to open edit mode on an editable span.
  def editable_trigger(name, edit_string, object_id)
    trigger_name = "#{name}_trigger"
    %{
      <span class="edit_trigger" id="#{trigger_name}">#{edit_string}</span>
      <script type="text/javascript">
        /* Find and trigger "edit-click" event on correct Jeditable instance. */
        $(".edit_trigger[id='#{trigger_name}']").bind("click", function() {
            $(".editable[data-id='#{object_id}'][data-name='#{name}']").trigger("edit-click");
        });
      </script>
    }.html_safe
  end
end

