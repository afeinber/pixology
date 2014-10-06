class VotesController <  ApplicationController

  before_action :authenticate_user!
  respond_to :json


  def create

    @vote = Vote.find_or_initialize_by(user_id: current_user.id, votable: votable)
    @vote.update(vote_params)
    @vote.save!
    respond_with(@vote.votable, @vote)
  end

  def destroy
    @vote = Vote.find_by(user_id: current_user.id, votable: votable)
    @vote.destroy!

    #https://github.com/kbparagua/paloma/issues/31
    render :json => @vote
  end

  private

  def votable
    votable_type.camelize.constantize.find(votable_id)
  end


  def votable_type
    %w(comment image).detect{ |type| params["#{type}_id"].present? }
  end


  def votable_id
    params["#{votable_type}_id"]
  end

  def vote_params
    params.require(:vote).permit(:is_upvote)
  end
end
