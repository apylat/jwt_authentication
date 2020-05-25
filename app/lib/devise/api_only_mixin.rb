module Devise
  module ApiOnlyMixin
    def self.included(klass)
      klass.class_eval do
        klass.include ActionController::MimeResponds

        klass.respond_to :json
      end
    end
  end
end
