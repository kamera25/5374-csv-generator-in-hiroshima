require 'spec_helper'

include Hiroshima5374

describe AreaDays::CSVCreator do

  csv_file = File.join(spec_root, "data", "area_days.csv")

  before :each do
    FileUtils.cd spec_root
    if (File.exist?(csv_file))
      FileUtils.rm csv_file
    end
  end

  after :each do
    FileUtils.cd File.join(spec_root, '..')
  end

  describe '#create' do
    subject { AreaDays::CSVCreator.new([['区',area_days_sample_html]]).create }
    it 'area_days.csv が作成される' do
      subject
      expect(File.exist?(csv_file)).to be_true
    end
  end
end
