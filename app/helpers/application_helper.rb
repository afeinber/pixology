module ApplicationHelper
  include FoundationRailsHelper::FlashHelper

  def vote_class(votable, is_upvote)
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

end

