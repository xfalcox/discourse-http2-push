# name: discourse-http2-push
# about: POC of pushing Discourse assets with HTTP/2 Push
# version: 0.1
# authors: Rafael 'Falco' dos Santos Silva
# url: https://github.com/xfalcox/discourse-http2-push

after_initialize do
  load File.expand_path('../app/controllers/application_controller.rb', __FILE__)
end