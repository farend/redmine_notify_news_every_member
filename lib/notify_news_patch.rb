require_dependency 'news'

module NotifyNewsPatch
  def self.included(base)
    base.send(:include, WrapperMethods)
    
    base.class_eval do
      alias_method_chain :recipients, :patch
    end
  end

  module WrapperMethods
    def recipients_with_patch
      notified = project.users  # original: project.notified_users
      notified.reject! {|user| !visible?(user)}
      notified.collect(&:mail)
    end
  end
end

News.send(:include, NotifyNewsPatch)
