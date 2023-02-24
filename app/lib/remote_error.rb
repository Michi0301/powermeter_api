class RemoteError < StandardError
  def initialize
    super("An error occured fetching data from server.")
  end
end
