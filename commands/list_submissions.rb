module Commands
  ListSubmissions = Proc.new do |count:, page:|
    [
      { id: 1, title: "Hello world", text: "aaaaaa" },
      { id: 2, title: "Hello world", text: "aaaaaa" },
      { id: 3, title: "Hello world", text: "aaaaaa" },
    ]
  end
end