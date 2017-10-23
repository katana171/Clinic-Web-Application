Rails.application.routes.draw do

  get 'encounters/show'

  get '/encounters/new/:id' => 'encounters#new', as: 'new_encounter'

  get '/encounters/:id' =>'encounters#show', as: 'show_current_encounter'

  get 'encounters/edit'

  get '/encounters/edit/:id' => 'encounters#edit', as: 'edit_current_encounter'

  post 'encounters/create'

  get 'encounters/destroy'

  get 'encounters/destroy/:id' =>'encounters#destroy', as: 'delete_current_encounter'

  patch '/encounters/edit/:id' => 'encounters#update', as: 'edit_encounter_id'



  get '/patients' => 'patients#index', as: 'main_page'

  post '/patients' => 'patients#create', as: 'creating'

  get 'patients/new' => 'patients#new', as: 'new_patient'

  post 'patients/new'  => 'patients#new', as: 'create_patient'

  get 'patients/edit' => 'patients#edit', as: 'edit'

  get 'patients/create' => 'patients#create'

  get 'patients/destroy'

  get 'patients/destroy/:id' =>'patients#destroy', as: 'delete_patient'

  get '/patients/:id' =>'patients#show', as: 'patientss'

  get '/patients/edit/:id' => 'patients#edit', as: 'edit_patient'

  patch '/patients/edit/:id' => 'patients#update', as: 'edit_patient_id'
end
