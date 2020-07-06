require_relative '../lib/03_dear_deputy'

uri = 'http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605036'

describe "the get_deputy_email function" do
  it "should return a String" do
    expect(get_deputy_email(uri)).to be_instance_of(String)
  end
  it "should return a String" do
    expect(get_deputy_email(uri)).to eq('damien.abad@assemblee-nationale.fr')
  end
end

describe "the array_get_deputy_urls function" do
  it "should return a String" do
    expect(array_get_deputy_urls).to be_instance_of(Array)
  end
  it "should not be nil" do
    expect(array_get_deputy_urls).to_not be_nil
  end
  it "should not be empty" do
    expect(array_get_deputy_urls).to_not be_empty
  end
end

describe "the array_get_deputy_name function" do
  it "should return a String" do
    expect(array_get_deputy_name).to be_instance_of(Array)
  end
  it "should not be nil" do
    expect(array_get_deputy_name).to_not be_nil
  end
  it "should not be empty" do
    expect(array_get_deputy_name).to_not be_empty
  end
end

describe "the give_first_name function" do
  it "should be equal to 'Damien'" do
    expect(give_first_name("Mr. Damien Abad")).to eq('Damien')
  end
end

describe "the give_last_name function" do
  it "should be equal to 'Damien'" do
    expect(give_last_name("Mr. Damien Abad")).to eq('Abad')
  end
end

describe "the give_last_name_first_letter  function" do
  it "should be equal to 'Damien'" do
    expect(give_last_name_first_letter("Mr. Damien Abad")).to eq('a')
  end
end
