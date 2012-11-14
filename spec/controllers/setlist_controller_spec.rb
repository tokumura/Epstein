# coding: utf-8
require 'spec_helper'

describe SetlistController do
  before do
  end

  describe "GET /setlist_index" do
    it "should be successfull" do
      get 'index'
      response.should be_success
    end
  end

  describe "POST /make_setlist_index" do
    it "should be successfull" do
      post 'make', :setlist => {:number_of_songs => '10', :number_of_george => '3', :number_of_ringo => '2' }
      response.should be_success
    end
  end

end
