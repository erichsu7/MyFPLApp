class DataSyncer::MasterSyncer
  # syncs everything

  def call
    # should this be wrapped in a transaction?
    DataSyncer::BootstrapStaticSyncer.new.call
    DataSyncer::FixturesSyncer.new.call
    DataSyncer::ElementSummarySyncer.new.call
    self
  end

end
