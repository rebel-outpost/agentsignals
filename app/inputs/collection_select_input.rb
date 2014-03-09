class CollectionSelectInput < SimpleForm::Inputs::CollectionSelectInput
  unless Rails.env.test?
    def input_html_classes
      super.push('chosen-select')
    end
  end
end