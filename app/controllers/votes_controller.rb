class VotesController <  ApplicationController


  before_action :authenticate_user!

  def default_serializer_options
    {root: false}
  end
  respond_to :json


  def create
    @vote = current_user.votes.new(vote_params)
    @vote.votable = votable
    if (tbd = Vote.find_by(user_id: current_user.id, votable: votable)).present?
      tbd.destroy
    end
    @vote.save
    respond_with(@vote.votable, @vote)
  end

  def destroy
    @vote = Vote.find_by(user_id: current_user.id, votable: votable)
    @vote.destroy
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
