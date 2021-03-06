class SyncRemotePurchaseOrdersWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false, unique: :until_executed

  def perform
    PurchaseOrdersSyncer.new.sync_remote
  end
end
