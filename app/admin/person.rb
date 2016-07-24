ActiveAdmin.register Person do
  permit_params :name, :email, :profession, :blood_group, :address, :phone, :approved

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs do       # builds an input field for every attribute
      f.input :name
      f.input :email
      f.input :blood_group, collection: Person::BLOOD_GROUPS
      f.input :profession
      f.input :address, input_html: { rows: 3 }
      f.input :phone
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
end
