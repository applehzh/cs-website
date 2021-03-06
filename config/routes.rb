CloudSpokes::Application.routes.draw do
  
  resources :sessions

  match '/signup',  :to => 'sessions#signup'
  match '/signup/:id', :to => 'sessions#signup_referral'
  match '/signup_complete', :to => 'sessions#signup_complete'  
  match '/signup_third_party_create', :to => 'sessions#signup_third_party_create'
  match '/signup_cs_create', :to => 'sessions#signup_cs_create'  
  match '/logout', :to => 'sessions#destroy'  
  match '/login', :to => 'sessions#login' 
  match '/login_popup', :to => 'sessions#login_popup'  
  match '/login_required', :to => 'sessions#login_required'  
  match '/login_cs_auth',  :to => 'sessions#login_cs_auth'
  match "/reset_password"               => "sessions#public_reset_password"
  match "/reset_password_submit"        => "sessions#public_reset_password_submit"  
  match "/forgot_password"              => "sessions#public_forgot_password"
  match "/forgot_password_send"         => "sessions#public_forgot_password_send"
  match "/forgot_service"               => "sessions#forgot_service"
  
  match "/members/order_by_name"        => "members#index", :defaults => { :order_by => 'name' }
  match "/members/order_by_win"         => "members#index", :defaults => { :order_by => 'total_wins__c' }
  match "/members/order_by_active"      => "members#index", :defaults => { :order_by => 'challenges_entered__c' }
  match "/members/search"               => "members#search", :as => :members_search
  match "/members/:id/past_challenges"  => "members#past_challenges"
  match "/members/:id/active_challenges"  => "members#active_challenges"  
  match "/members/:id/recommend"        => "members#recommend", :as => :recommend_member
  match "/members/:id/recommend_new"    => "members#recommend_new", :as => :recommend_member_new
  resources :members

  match "account"                       => "accounts#index"
  match "/account/challenges"           => "accounts#challenges"
  match "/account/school"               => "accounts#school"
  match "/account/details"              => "accounts#details"
  match "/account/payments"             => "accounts#payments"
  match "/account/public_profile"       => "accounts#public_profile"  
  match "/account/password"             => "accounts#password"
  match "/account/password_reset"       => "accounts#password_reset", :as => :password_reset
  match "/account/outstanding_reviews"  => "accounts#outstanding_reviews" , :as => :outstanding_reviews
  match '/account/scorecard/:id'        => 'accounts#scorecard'
  match '/account/scorecard_save'       => 'accounts#scorecard_save', :as => :scorecard_save
  match '/account/profile_pic'          => 'accounts#profile_pic', :as => :profile_pic 

  #challenges
  get "challenges/index"
  match 'challenges', :to => 'challenges#index', :as => :challenges
  match 'challenges/feed', :to => 'challenges#feed', :as => :feed, :defaults => { :format => 'atom' }
  match 'challenges/feed/recent', :to => 'challenges#feed_recent', :as => :feed_recent, :defaults => { :format => 'atom' }
  match 'challenges/recent', :to => 'challenges#recent'
  match 'challenges/:id', :to => 'challenges#show', :as => :challenge
  match 'challenges/:id/preview', :to => 'challenges#preview'  
  match 'challenges/:id/registrants', :to => 'challenges#registrants', :as => :registrants
  match 'challenges/:id/register', :to => 'challenges#register', :as => :register
  match 'challenges/:id/agree_to_tos', :to => 'challenges#register_agree_to_tos', :as => :agree_tos
  match 'challenges/:id/results', :to => 'challenges#results', :as => :results
  match 'challenges/:id/survey', :to => 'challenges#survey', :as => :survey
  match 'challenges/:id/submissions/:participant', :to => 'challenges#participant_submissions', :as => :participant_submissions
  match 'challenges/:id/scorecard/:scorecard/:reviewer/:username', :to => 'challenges#participant_scorecard', :as => :participant_scorecard
  match 'challenges/:id/watch', :to => 'challenges#watch', :as => :watch
  match 'challenges/:id/scorecard', :to => 'challenges#scorecard', :as => :scorecard_display
  match 'challenges/:id/new_comment', :to => 'challenges#new_comment', :as => :challenge_comment 
  match 'challenges/:id/toggle_discussion_email', :to => 'challenges#toggle_discussion_email', :as => :toggle_discussion_email  
  match 'challenges/:id/all_submissions', :to => 'challenges#all_submissions', :as => :all_submissions
  match 'challenges/:id/cal', :to => 'challenges#cal', :as => :cal  
  match 'challenges/:id/submission', :to => 'challenges#submission', :as => :submission
  match 'challenges/:id/submission_view_only', :to => 'challenges#submission_view_only', :as => :submission_view_only
  match 'challenges/:id/submission/url', :to => 'challenges#submission_url_upload', :as => :submission_url, :via => :post
  match 'challenges/:id/submission/file', :to => 'challenges#submission_file_upload', :as => :submission_file, :via => :post
  match 'challenges/:id/submission/url_delete', :to => 'challenges#submission_url_delete', :as => :submission_delete
  match 'leaderboard', :to => 'challenges#leaderboard', :as => 'leaderboards'
  match 'leaderboard_this_month', :to => 'challenges#leaderboard_this_month', :as => 'leaderboard_this_month'
  match 'leaderboard_this_year', :to => 'challenges#leaderboard_this_year', :as => 'leaderboard_this_year'
  match 'leaderboard_all_time', :to => 'challenges#leaderboard_all_time', :as => 'leaderboard_all_time'    
  
  # challenge admin -- legacy for CMC integration
  match 'challenge_admin/preview/:id', :to => 'challenges#preview'
  
  # quick quiz
  match 'quizes/:id/quiz', :to => 'quizes#show', :as => :takequiz
  match 'quizes/:id/answer', :to => 'quizes#answer', :as => :answerquiz
  match 'quizes/:id/practice', :to => 'quizes#practice', :as => :practicequiz
  match 'quizes/:id/leaderboard', :to => 'quizes#leaderboard', :as => :quizleaderboard
  match 'quizes/:id/results', :to => 'quizes#results', :as => :quizresults
  match 'quizes/:id/results_by_member/:member/:date', :to => 'quizes#results_by_member', :as => :quizresults_by_member
  match 'quizes/answer_by_member/:member', :to => 'quizes#answer_by_member', :as => :quizanswer_by_member  
  match 'quizes/:id/winners', :to => 'quizes#winners', :as => :quizwinners
  match 'quizes/flag_answer/:id', :to => 'quizes#flag_answer', :as => :flag_answer
  match 'quizes/:id/question', :to => 'quizes#fetch_question', :as => :fetchquestion
  
  match 'quiz_questions/authored', :to => 'quiz_questions#authored', :as => :questions_authored
  match 'quiz_questions/reviewed', :to => 'quiz_questions#reviewed', :as => :questions_reviewed  
  resources :quiz_questions
  
  match '/admin',  :to => 'admin#index'
  get "admin/index"
  get "admin/display_users"
  get "admin/delete_all_users"
  get "admin/display_settings"
  get "admin/send_mail"
  get "admin/refresh_token"
  get "admin/flush_notifications"
  match 'admin/blogfodder/:id', :to => 'admin#blogfodder'
  
  match '/auth/:provider/callback', :to => 'sessions#callback'
  match '/auth/failure', :to => 'sessions#callback_failure'  
  
  # hacathons
  match 'hackathons/:id', :to => 'hackathons#show', :as => :hackathon
  get "hackathons/results"
  get "hackathons/page"
  
  #content -- eventually will be siteforce
  match "/about", to: "content#about"
  match "/about_challenge", to: "content#about_challenge"
  match "/about_register", to: "content#about_register"
  match "/about_collaborate", to: "content#about_collaborate"
  match "/about_submit", to: "content#about_submit"
  match "/about_review", to: "content#about_review"  
  match "/about_win", to: "content#about_win"    
  match "/faq", to: "content#faq"
  match "/privacy", to: "content#privacy"
  match "/tos", to: "content#tos"
  match "/badges", to: "content#badges"
  match "/notifications", to: "content#notifications"
  match "/contact", to: "content#contact"
  match "/contact_send", to: "content#contact_send"
  match "/login_help", to: "content#login_help"
  match "/welcome2cloudspokes", :to => "content#welcome", :as => :welcome2cloudspokes
  match "/login_denied", to: "content#login_denied", :as => :login_denied
  match "/home", to: "content#home", :as => :home
  root to: 'content#home'
  
  mount Resque::Server, :at => "/resque"
  
  # 404 errors
  match '*a', :to => 'errors#routing'
end
