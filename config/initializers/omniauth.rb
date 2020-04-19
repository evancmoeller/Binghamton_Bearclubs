OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :developer if Rails.env.development?
    provider :github, '0880f8f52341d0ec8b02', 'f87acaac95706c24218971c38f841003c041c83e',
            { :name => "github", :scope => ['read:user', 'user:email']}
    provider :facebook, '508752000004645', 'ae27e8447c2b57fa58c26a911f94dd0f'
end