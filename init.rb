require 'redmine'
require_dependency 'notify_news_patch'

Redmine::Plugin.register :redmine_notify_news_every_member do
  name 'Redmine Notify News Every Member plugin'
  author 'FAR END Technologies Corporation'
  description "Notify news to every member in a project irrespective of the member's account settings."
  version '0.0.2'
end
