require 'spec_helper'

describe CompaniesHistoryWorker do
  it { should be_processed_in :default }
  it { should be_retryable 3 }
  it { should be_unique }
end