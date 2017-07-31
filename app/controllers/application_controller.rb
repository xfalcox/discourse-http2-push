#based on https://gist.github.com/tomfuertes/6978b594d34038d763a9ee3c4d4c9b14

class ApplicationController < ActionController::Base

after_action :server_push_headers

  def server_push_headers

    if response && response.content_type && response.content_type.include?("text/html") && request.format.html? && self.send(:_layout) == "application"

      assets = Rails.cache.fetch("http2-push-assets}", expires_in: 1.week) do
        css = response.body.scan(/link\shref="(.*\/stylesheets\/\w+.css)/).flatten.reject{|asset| asset.match(/admin|theme/)}
        js = response.body.scan(/script src='(.*\.js)'/).flatten.reject{|asset| asset.match(/admin/)}

        css_assets = css.map do |asset|
          "<#{asset}>; rel=preload; as=style"
        end

        js_assets = js.map do |asset|
          "<#{asset}>; rel=preload; as=script"
        end

        (css_assets + js_assets).join(', ')
      end

      response.headers['Link'] = assets
    end
  end

end
