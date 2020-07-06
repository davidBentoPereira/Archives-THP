require_relative '../lib/01_crypto_scrapper'

describe "the crypto scrapper function" do
  it "should be a hash" do
    expect(crypto_scrapper).to be_instance_of(Hash)
  end
  it "should not be nil" do
    expect(crypto_scrapper).not_to be_nil
  end
  it "should not be empty" do
    expect(crypto_scrapper).not_to be_empty
  end
end
