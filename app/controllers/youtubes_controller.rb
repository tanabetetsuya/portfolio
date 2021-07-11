class YoutubesController < ApplicationController
  GOOGLE_API_KEY = ENV['API_KEY']

  def find_videos(keyword, after: 1.months.ago, before: Time.now)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = GOOGLE_API_KEY

    next_page_token = nil
    opt = {
      q: keyword,
      type: 'video',
      max_results: 50,
      order: :viewCount,
      page_token: next_page_token,
      published_after: after.iso8601,
      published_before: before.iso8601
    }
    service.list_searches(:snippet, opt)
  end

  def index
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

end

