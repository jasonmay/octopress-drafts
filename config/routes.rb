Drafts::Application.routes.draw do
  root :to => 'home#index'
  match 'drafts' => 'drafts#index'
  match 'drafts/:name' => 'drafts#show', :as => 'draft'
  match 'drafts/:name/save' => 'drafts#save', :as => 'draft_save'
end
