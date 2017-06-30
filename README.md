# Discourse HTTP/2 Server Push

This a small plugin, that enables server push for static assets in Discourse.

## Using

This plugin will include the main assets on a `Link` header in the HTTP response. This will enable HTTP/2 Push if you are using a compatible reverse proxy, like:

- [Cloudflare](https://blog.cloudflare.com/announcing-support-for-http-2-server-push-2/)
- [Fastly](https://docs.fastly.com/guides/performance-tuning/http2-server-push)
- [Caddy](https://caddyserver.com/docs/push) (see [this bug](https://github.com/mholt/caddy/issues/1717))
- [Apache](https://httpd.apache.org/docs/2.4/howto/http2.html#push)
- [H20](https://h2o.examp1e.net/configure/http2_directives.html#server-push)