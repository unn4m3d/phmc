module PHMC
  def self.launcher_version
    ENV["PHMC_LV"]? || "0.2.0"
  end
end
