require 'spec_helper'

describe CompaniesWorker do
  it { should be_processed_in :default }
  it { should be_retryable 3 }
  it { should be_unique true }

  it "enqueues another awesome job" do
    subject.perform
    expect(CompaniesWorker).to have_enqueued_job("CompaniesHistoryWorker", true)
  end
end