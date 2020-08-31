class Home::Index < BrowserAction
  include Auth::AllowGuests

  get "/" do
      html IndexPage
  end
end
