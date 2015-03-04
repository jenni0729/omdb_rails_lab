class MoviesController < ApplicationController
  def index
    @movie = []
   
    if params.key? :movie
      request = Typhoeus::Request.new( #instance of the request object/class for Typhoeus module
      "http://www.omdbapi.com/?",
      method: :get,
      params: {s: params[:movie]} #value of s is movie. 
      )

      request.run
  
      my_hash = JSON.parse(request.response.body)
      @movie = my_hash["Search"]
  #hash notation, storing the value in a key 
    end

    respond_to do |format|
      format.html #render .erb template as normal
      format.json {render :json => @movie}
    end
  end 
end 