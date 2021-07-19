class YoutubesController < ApplicationController
  GOOGLE_API_KEY = ENV['API_KEY']

  def find_videos(keyword, before: Time.now)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = GOOGLE_API_KEY

    next_page_token = nil
    opt = {
      q: keyword,
      type: 'video',
      max_results: 5,#検索件数を上限５０件に設定
      order: :viewCount,
      page_token: next_page_token,
      published_before: before.iso8601
    }
    service.list_searches(:snippet, opt)
  end

  def create
    @youtube = Youtube.new(youtube_params)
    @youtube.save
    redirect_to youtubes_path
  end

  def index
    #binding.irb
    @user = current_user
    @exercise_suggestion = ExerciseSuggestion.new
    keyword = params[:keyword].to_s
    @youtube_data = find_videos('有酸素運動')
    regexp = Regexp.new('.*' + keyword + '.*')
    f_items = []
    @youtube_data.items.each {|data|
      snippet = data.snippet
      f_items << data if snippet.title.match(regexp)
    }
    @youtube_data.items = f_items

  end

  def search
    @youtube = Youtube.new
  end
  
  private
  def youtube_params
    params.require(:youtube).permit(:keyword)
  end

end

