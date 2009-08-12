require 'mailer'

module NotifyNewsMailerModelPatch
  def self.included(base)
    base.send(:include, WrapperMethods)
    
    base.class_eval do
      alias_method_chain :news_added, :every_member
    end
  end

  module WrapperMethods
    def news_added_with_every_member(news)
    redmine_headers 'Project' => news.project.identifier
    recipients news.project.members.collect {|m| m.user.mail}
    subject "[#{news.project.name}] #{l(:label_news)}: #{news.title}"
    body :news => news,
         :news_url => url_for(:controller => 'news', :action => 'show', :id => news)

    end
  end
end

Mailer.send(:include, NotifyNewsMailerModelPatch)
