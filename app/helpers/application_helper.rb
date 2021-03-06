module ApplicationHelper
  def object_for_notification_display(obj)
    if obj.class.name == 'Favorite'
      obj.image
    elsif obj.class.name == 'Comment'
      while obj.commentable_type == 'Comment'
        obj = obj.commentable
      end
      obj.commentable
    elsif obj.class.name == 'Image'
      obj
    end
  end

  def name_for_notification_display(obj)
    if obj.class.name == 'Favorite'
      'image'
    elsif obj.class.name == 'Comment'
      obj.commentable.class.name.downcase
    elsif obj.class.name == 'Image'
      'image'
    end
  end

  def notification_count
    if user_signed_in?
      current_user.mailbox.notifications.count
    else
      0
    end
  end

  def member_length(user)
    time_ago_in_words((Time.now - user.created_at).to_i.seconds.ago)
  end


  def vote_class(votable, is_upvote)
    if user_signed_in?
      vote = current_user.votes.find_by(votable: votable)
      if !vote.present?
        "secondary"
      elsif is_upvote && vote.is_upvote
        "success"
      elsif !is_upvote && !vote.is_upvote
        "alert"
      else
        "secondary"
      end
    else
      "secondary"
    end
  end

  def bar_width(upvotes, total_votes)
    if total_votes == 0
      return 0
    end
    ( upvotes.to_f / total_votes ) * 100

  end

  def bar_is_success(perc)
    if perc > 50
      "success"
    else
      "alert"
    end
  end

   DEFAULT_KEY_MATCHING = {
      :alert     => :alert,
      :notice    => :success,
      :info      => :standard,
      :secondary => :secondary,
      :success   => :success,
      :error     => :alert
    }
    def display_flash_messages(key_matching = {})
      key_matching = DEFAULT_KEY_MATCHING.merge(key_matching)

      flash.inject "" do |message, (key, value)|
        message += content_tag :div, :data => { :alert => "" }, :class => "alert-box #{key_matching[key.to_sym] || :standard}" do
          (value + link_to("&times;".html_safe, "#", :class => :close)).html_safe
        end
      end.html_safe
    end

end



