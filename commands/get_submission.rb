module Commands
  GetSubmission = Proc.new do |id:|
    { 
      id: id,
      title: "Hello world",
      text: "aaaaaa",
      comments: [],
    }
  end
end