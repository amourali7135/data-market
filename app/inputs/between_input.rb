class BetweenInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    field1 = @builder.number_field(:"#{attribute_name}", input_html_options)
    field2 = @builder.number_field(:"#{attribute_name}", input_html_options)

    # Be aware for I18n: translate the "and" here
    (field1 << @builder.label(:"#{attribute_name}", 'and', class: 'separator') << field2).html_safe
  end

  # Make the label be for the first of the two fields
  def label_target
    :"#{attribute_name}"
  end
end