web:     bundle exec rails server mongrel -p $PORT
worker:  env QUEUE=* bundle exec rake enironment resque:work
quiz_worker: env QUEUE=quickquiz_answer_queue bundle exec rake resque:work 