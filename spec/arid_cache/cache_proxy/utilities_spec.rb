require "spec_helper"

describe AridCache::CacheProxy::Utilities do
  describe 'order_by' do
    it "id column should be prefixed by the table name" do
      stub(::ActiveRecord::Base).is_mysql_adapter? { true }
      AridCache.order_by([1,2,3], Company).should =~ %r[#{Company.table_name}]
    end

    it "id column should be prefixed by the table name" do
      stub(::ActiveRecord::Base).is_mysql_adapter? { false }
      AridCache.order_by([1,2,3], Company).should =~ %r[#{Company.table_name}]
    end
  end

  describe "find_all_by_id" do
    before :each do
      @user = User.make
      @user.companies << Company.make
      @user.companies << Company.make
      Company.make # there must be more than 2 companies for it to fail
    end

    it "should maintain order" do
      @result = AridCache::CacheProxy::Utilities.find_all_by_id(Company, @user.companies.reverse.map(&:id))
      @result.should == @user.companies.reverse
    end

    it "should apply options" do
      @result = AridCache::CacheProxy::Utilities.find_all_by_id(Company, @user.companies.reverse.map(&:id),
        :limit => 1,
        :offset => 1
      )
      @result.size.should == 1
      @result.first.should == @user.companies.reverse[1]
    end
    
    it "should not fail when ids is empty" do
      lambda {
        AridCache::CacheProxy::Utilities.find_all_by_id(Company, []).inspect  
      }.should query(0)
    end
  end

  describe "find_all_by_id with custom DB names" do
    before do
      @custom_names = 2.times.map { CustomName.create! }
    end

    it "should return instances" do
      @result = AridCache::CacheProxy::Utilities.find_all_by_id(CustomName, @custom_names.map(&:id))
      @result.should == @custom_names
    end
  end
end
