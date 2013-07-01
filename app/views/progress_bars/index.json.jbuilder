json.array!(@progress_bars) do |progress_bar|
  json.extract! progress_bar, :name
  json.url progress_bar_url(progress_bar, format: :json)
end
