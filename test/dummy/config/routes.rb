Rails.application.routes.draw do
  mount Homeland::Note::Engine => "/homeland-note"
end
