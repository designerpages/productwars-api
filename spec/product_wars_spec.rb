require 'spec_helper'

PRODUCT_KEYS = [
                 "active",
                 "asset_url",
                 "created_at",
                 "description",
                 "dp_id",
                 "fights",
                 "global_rank",
                 "image_url",
                 "manufacturer",
                 "name",
                 "permalink",
                 "updated_at",
                 "wins"
               ]

WAR_KEYS = [ 
            'name', 
            'created_at', 
            'updated_at', 
            'id', 
            'fights', 
            'description', 
            'active' 
           ]

STATS_KEYS = [
              'dp_id',
              'fights',
              'global_rank',
              'name',
              'manufacturer',
              'wins',
              'win_rate'
             ]

describe 'ProductWars' do
  describe "::product" do

    context "successful request" do
      use_vcr_cassette

      it "should retrieve a ProductWars::Product" do
        response = ProductWars.product(42067)
        response.class.should == ProductWars::Product
      end

      it "the reponse should contain the keys specified in the API docs" do 
        product = ProductWars.product(42067)

         for key in PRODUCT_KEYS do
           product.has_key?(key).should == true
           #TODO This fails because the "id" attribute isn't accounted for.
           # This is because the dp_id takes the place of the product id in
           # all circumstances. In other words, the Product Wars app has a bug.
           product.keys.count.should == PRODUCT_KEYS.count
         end
      end
    end

    context "unsuccessful request" do
      use_vcr_cassette

      it "should raise a NotFound error if the specified resource doesn't exist" do
        lambda{ 
          ProductWars.product('bad_id') 
        }.should raise_error(ProductWars::Errors::NotFound)
      end
    end
  end

  describe "::wars_containing_product" do
    context "successful request" do
      use_vcr_cassette

      it "should retrieve an Array" do
        wars_array = ProductWars.wars_containing_product(42067)
        wars_array.class.should == Array
      end

      it "should retrieve an Array containing ProductWars::War objects" do
        wars_array = ProductWars.wars_containing_product(42067)

        for h in wars_array do
          h.class.should == ProductWars::War
        end
      end

      it "should contain properly formatted war hashes" do
        wars_array = ProductWars.wars_containing_product(42067)

        for w in wars_array
           for key in WAR_KEYS do
             w.has_key?(key).should == true
             w.keys.count.should == WAR_KEYS.count
           end
        end
      end
    end

    context "unsuccessful request" do
      use_vcr_cassette

      it "should raise a NotFound error if the specified resource doesn't exist" do
        lambda{ 
          ProductWars.wars_containing_product('bad_id') 
        }.should raise_error(ProductWars::Errors::NotFound)
      end
    end
  end

  describe "::all_wars" do
    context "successful wars index request" do
      use_vcr_cassette

      it "should retrieve an Array" do
        wars_array = ProductWars.all_wars
        wars_array.class.should == Array
      end

      it "should retrieve an Array containing ProductWars::War objects" do
        wars_array = ProductWars.all_wars

        for h in wars_array do
          h.class.should == ProductWars::War
        end
      end

      it "should contain properly formatted war hashes" do
        wars_array = ProductWars.all_wars

        for w in wars_array
           for key in WAR_KEYS do
             w.has_key?(key).should == true
             w.keys.count.should == WAR_KEYS.count
           end
        end
      end
    end

    # There are currently no exceptions this can raise
    #context "unsuccessful request" do
    #  use_vcr_cassette

    #  it "should raise a NotFound error if the specified resource doesn't exist" do
    #    lambda{ 
    #      ProductWars.all_wars
    #    }.should raise_error(ProductWars::Errors::NotFound)
    #  end
    #end
  end

  describe "::product_stats" do
    context "successful request" do
      use_vcr_cassette

      it "should retrieve a ProductWars::Stats" do
        response = ProductWars.product_stats(42067)
        response.class.should == ProductWars::Stats
      end

      it "the reponse should contain the keys specified in the API docs" do 
        stats = ProductWars.product_stats(42067)

         for key in STATS_KEYS do
           stats.has_key?(key).should == true
           stats.keys.count.should == STATS_KEYS.count
         end
      end
    end

    context "unsuccessful request" do
      use_vcr_cassette

      it "should raise a NotFound error if the specified resource doesn't exist" do
        lambda{ 
          ProductWars.product_stats('bad_id') 
        }.should raise_error(ProductWars::Errors::NotFound)
      end
    end
  end

  describe "::war" do
    context "successful request" do
      use_vcr_cassette

      it "should retrieve a ProductWars::War" do
        response = ProductWars.war(1)
        response.class.should == ProductWars::War
      end

      it "the reponse should contain the keys specified in the API docs" do 
        war = ProductWars.war(1)

         for key in WAR_KEYS do
           war.has_key?(key).should == true
           war.keys.count.should == WAR_KEYS.count
         end
      end
    end

    context "unsuccessful request" do
      use_vcr_cassette

      it "should raise a NotFound error if the specified resource doesn't exist" do
        lambda{ 
          ProductWars.war('bad_id') 
        }.should raise_error(ProductWars::Errors::NotFound)
      end
    end
  end

  describe "::products_in_war" do
    context "successful products index request" do
      use_vcr_cassette

      it "should retrieve an Array" do
        products_array = ProductWars.products_in_war(1)
        products_array.class.should == Array
      end

      it "should retrieve an Array containing ProductWars::Product objects" do
        products_array = ProductWars.products_in_war(1)

        for h in products_array do
          h.class.should == ProductWars::Product
        end
      end

      it "should contain properly formatted product hashes" do
        products_array = ProductWars.products_in_war(1)

        for p in products_array
           for key in PRODUCT_KEYS do
             p.has_key?(key).should == true
             p.keys.count.should == PRODUCT_KEYS.count
           end
        end
      end
    end

    context "unsuccessful request" do
      use_vcr_cassette

      it "should raise a NotFound error if the specified resource doesn't exist" do
        lambda{ 
          ProductWars.products_in_war('bad_id') 
        }.should raise_error(ProductWars::Errors::NotFound)
      end
    end
  end

  describe "::global_leaders" do
    context "successful products index request" do
      use_vcr_cassette

      it "should retrieve an Array" do
        products_array = ProductWars.global_leaders
        products_array.class.should == Array
      end

      it "should retrieve an Array containing ProductWars::Product objects" do
        products_array = ProductWars.global_leaders

        for h in products_array do
          h.class.should == ProductWars::Product
        end
      end

      it "should contain properly formatted product hashes" do
        products_array = ProductWars.global_leaders

        for p in products_array
           for key in PRODUCT_KEYS do
             p.has_key?(key).should == true
             p.keys.count.should == PRODUCT_KEYS.count
           end
        end
      end
    end

    #There are currently no exceptions this will raise directly
    #context "unsuccessful request" do
    #  use_vcr_cassette

    #  it "should raise a NotFound error if the specified resource doesn't exist" do
    #    lambda{ 
    #      ProductWars.global_leaders
    #    }.should raise_error(ProductWars::Errors::NotFound)
    #  end
    #end
  end

  describe "::leaders_in_war" do
    context "successful request" do
      use_vcr_cassette

      it "should retrieve an Array" do
        products_array = ProductWars.leaders_in_war(1)
        products_array.class.should == Array
      end

      it "should retrieve an Array containing ProductWars::Product objects" do
        products_array = ProductWars.leaders_in_war(1)

        for h in products_array do
          h.class.should == ProductWars::Product
        end
      end

      it "should contain properly formatted product hashes" do
        products_array = ProductWars.leaders_in_war(1)

        for p in products_array
           for key in PRODUCT_KEYS do
             p.has_key?(key).should == true
             p.keys.count.should == PRODUCT_KEYS.count
           end
        end
      end
    end

    context "unsuccessful request" do
      use_vcr_cassette

      it "should raise a NotFound error if the specified resource doesn't exist" do
        lambda{ 
          ProductWars.leaders_in_war('bad_id') 
        }.should raise_error(ProductWars::Errors::NotFound)
      end
    end
  end
end
