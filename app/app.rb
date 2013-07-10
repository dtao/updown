module Updown
  class App < Padrino::Application
    register SassInitializer
    register Padrino::Rendering
    register Padrino::Mailer
    register Padrino::Helpers
    register Padrino::Cookies

    enable :sessions

    def respond(data)
      content_type 'text/javascript'
      "#{params['callback']}(#{data.to_json})"
    end

    get '/' do
      render :index
    end

    get '/counts' do
      subject = Subject.first(:uri => params['uri']) || Subject.new
      respond(subject.vote_counts)
    end

    get '/up' do
      subject = Subject.first_or_create(:uri => params['uri'])
      if cookie[subject.id].nil?
        subject.adjust!({ :upvotes => 1 }, true)
        cookie[subject.id] = 'up'
        respond(subject.vote_counts)

      elsif cookie[subject.id] == 'down'
        subject.adjust!({ :upvotes => 1, :downvotes => -1 }, true)
        cookie[subject.id] = 'up'
        respond(subject.vote_counts)

      else
        respond(:status => 'duplicate')
      end
    end

    get '/down' do
      subject = Subject.first_or_create(:uri => params['uri'])
      if cookie[subject.id].nil?
        subject.adjust!({ :downvotes => 1 }, true)
        cookie[subject.id] = 'down'
        respond(subject.vote_counts)

      elsif cookie[subject.id] == 'up'
        subject.adjust!({ :upvotes => -1, :downvotes => 1 }, true)
        cookie[subject.id] = 'down'
        respond(subject.vote_counts)

      else
        respond(:status => 'duplicate')
      end
    end
  end
end
